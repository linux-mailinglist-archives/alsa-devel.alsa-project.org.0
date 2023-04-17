Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7F26E436D
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 11:17:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A7C2852;
	Mon, 17 Apr 2023 11:16:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A7C2852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681723048;
	bh=G78UB8zPBN8wJVPKTPD3IMl7TdmG/aI/BzkRaQaMOPU=;
	h=Date:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=HwlvQl2cYVuBw2bg2hXLgz3YLZacqc0LUaHJl12/0rgU1rDja6yiNCdUMjf8700IR
	 Fl/qIopwgxrYH9taVFurQYYHgXLkCDTrUp3v3yP34M8RSBa/jmimieYtCDrNh3aUxT
	 jErlAEgIVZu1EKIywWJMMx++6GcU+iREU3VGu3cM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FA10F8025D;
	Mon, 17 Apr 2023 11:16:37 +0200 (CEST)
Date: Mon, 17 Apr 2023 09:15:58 +0000
To: Saalim Quadri <danascape@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: wm8753: Convert to dtschema
References: <20230414223801.1106550-1-danascape@gmail.com>
In-Reply-To: <20230414223801.1106550-1-danascape@gmail.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4MKHL5XIMWBQJAG2M2H6ASOOSO6S7UVY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168172299686.26.15199391870130838574@mailman-core.alsa-project.org>
From: Charles Keepax via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, daniel.baluta@nxp.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 221A0F80266; Mon, 17 Apr 2023 11:16:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42DA0F80212
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 11:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42DA0F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=EkitFwzb
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33H5bPcp032193;
	Mon, 17 Apr 2023 04:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=+giweXyh9ja7j4+UCim1/7CY63h06GBLcMMPLEWqw+w=;
 b=EkitFwzbzeHg/nRde79sqH9f26ZY11JhZ/9L2J3DlP6O8JeoXb7erTm/AohCIQEclLMZ
 zFpT1PZS9suac6cQ9XxVBhtjLe3Y9a6EW22kCbHx6AACB8AiKQaJsG4CUbn/2K61hTXl
 187nGqlmkC40CAxO5KxhKNdFRujL3WbT2lgAZkHc84yge8DUwK2M94EM5ZAGadlxRH22
 QqwFro+WHMU9gpjNo0ELFZ4Ej6iJXIXavIm9L/JE/f5UGoqN9msF9gLAqkIi/sIpHfxN
 h70961EHFA4dKhhLAOEMPve/DYiZwXJU77tSi7FlWpwjZA9XSg15QKfiiB161YgP7+pr dw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pyrbpuku4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 04:15:59 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 17 Apr
 2023 04:15:58 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 17 Apr 2023 04:15:58 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 02FA9475;
	Mon, 17 Apr 2023 09:15:58 +0000 (UTC)
Date: Mon, 17 Apr 2023 09:15:58 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Saalim Quadri <danascape@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: wm8753: Convert to dtschema
Message-ID: <20230417091557.GZ68926@ediswmail.ad.cirrus.com>
References: <20230414223801.1106550-1-danascape@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230414223801.1106550-1-danascape@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: O7J3hXBjZ4d6_6QyDWIwmycs-qeRqfOx
X-Proofpoint-ORIG-GUID: O7J3hXBjZ4d6_6QyDWIwmycs-qeRqfOx
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4MKHL5XIMWBQJAG2M2H6ASOOSO6S7UVY
X-Message-ID-Hash: 4MKHL5XIMWBQJAG2M2H6ASOOSO6S7UVY
X-MailFrom: prvs=94711dec14=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, daniel.baluta@nxp.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4MKHL5XIMWBQJAG2M2H6ASOOSO6S7UVY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 14, 2023 at 10:38:01PM +0000, Saalim Quadri wrote:
> Convert the WM8753 audio codec bindings to DT schema.
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
