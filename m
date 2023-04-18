Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA806E62C3
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 14:35:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 117BBE71;
	Tue, 18 Apr 2023 14:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 117BBE71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681821319;
	bh=ZE/u+HitB7iYgvDwdvDHKHH0CU4r9+OXbTrbP31XAH8=;
	h=Date:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=Ns3MsgM6QJ4E+KwYUejS0tCIhTLVxOBPqK/8V2cAaPff9nB2gvPVtDTLgwFoCPHRG
	 xU1yRdt9333Ct5s4kgwcjj2mkuETwuoSdhy0QwBpFkQk3ggUrR+xKdIsHYswox11wY
	 oDe+/tkKg4Dcxw3ieuBuwGgTWmaW0Li5EgEje+Gw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A30FF80149;
	Tue, 18 Apr 2023 14:34:28 +0200 (CEST)
Date: Tue, 18 Apr 2023 12:34:15 +0000
To: Saalim Quadri <danascape@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: wm8737: Convert to dtschema
References: <20230417212400.161796-1-danascape@gmail.com>
In-Reply-To: <20230417212400.161796-1-danascape@gmail.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BKQHM5IFG2W76VGSETN4PJXKCXPY33A2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168182126751.26.17881305033825434136@mailman-core.alsa-project.org>
From: Charles Keepax via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, daniel.baluta@gmail.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78A45F80155; Tue, 18 Apr 2023 14:34:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C046EF800AC
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 14:34:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C046EF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=YOWTvFo7
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33I72Fd0026030;
	Tue, 18 Apr 2023 07:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=3lLKLRtqAbq/3/AQUi5bOsqxDBANDb2I15uT/KuIKxU=;
 b=YOWTvFo7qC8Q69rjyC6m20xZD6GDVMMfVA5YUeVQbddRc38Yaa/AghFHj5+PhI8A56JV
 GOoRwZMf2E6ZEu+gLyxF/TYeN6JWfqKZcM2PeOpIK34bmphkXPBlWMoeeMhyau7ghEhn
 yXik9fX5xSahAaapLDbss40C6V27MzcgYVRWA+0FO2LD6X+lfRW4ez1EvacQoKoiS3ht
 BEHU+0E2hZXj9ix3a4sz9HuwFu7yFgdCNyue0vq/kHJwifBsxh3O/OJNBrfWCzXZBgfR
 I502d7Q95dwllz1Ffoz80icwg3f4/J+9GHr443ZSuENKHAPfrb7GGqEXwsx+8ZydOe6T ZQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pyrbpx5t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 07:34:16 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 18 Apr
 2023 07:34:15 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 18 Apr 2023 07:34:15 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 21C6CB06;
	Tue, 18 Apr 2023 12:34:15 +0000 (UTC)
Date: Tue, 18 Apr 2023 12:34:15 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Saalim Quadri <danascape@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: wm8737: Convert to dtschema
Message-ID: <20230418123415.GB68926@ediswmail.ad.cirrus.com>
References: <20230417212400.161796-1-danascape@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230417212400.161796-1-danascape@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: T8rnZveW4jCzXGhyc7jWw9TWTi1sYJrQ
X-Proofpoint-ORIG-GUID: T8rnZveW4jCzXGhyc7jWw9TWTi1sYJrQ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: BKQHM5IFG2W76VGSETN4PJXKCXPY33A2
X-Message-ID-Hash: BKQHM5IFG2W76VGSETN4PJXKCXPY33A2
X-MailFrom: prvs=947255f9bd=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, daniel.baluta@gmail.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BKQHM5IFG2W76VGSETN4PJXKCXPY33A2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 17, 2023 at 09:24:00PM +0000, Saalim Quadri wrote:
> Convert the WM8737 audio CODEC bindings to DT schema
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
