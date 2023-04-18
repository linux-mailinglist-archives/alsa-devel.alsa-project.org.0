Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF5A6E5C49
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 10:39:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE249E0F;
	Tue, 18 Apr 2023 10:38:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE249E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681807175;
	bh=xx28zZiCSDOJsuf7fP0+EASu7uOcsaLgSEB6tDPfeyM=;
	h=Date:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=U5Z/kY+99+QO990dDxYJm1THyC1dUY4Z4eqkNHmvl2Nx3DjCnQMlWz589Jkea2tAT
	 IJgZ3fEQNj2oXSii79NYAW9/N90D/xVbvrQFKtT6BO7+mjf7yTKSXy+GHUIqJ6U8cq
	 O4UnPdpR0N2yTa2P4FKWuMXVTgFzW562u5zKbsuM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D7B4F80149;
	Tue, 18 Apr 2023 10:38:45 +0200 (CEST)
Date: Tue, 18 Apr 2023 08:38:29 +0000
To: Saalim Quadri <danascape@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: wm8728: Convert to dtschema
References: <20230417204323.137681-1-danascape@gmail.com>
In-Reply-To: <20230417204323.137681-1-danascape@gmail.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L27OTKKT6FBQOUU3K7Y33MZPWDQRNZMQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168180712402.26.6493944467739073240@mailman-core.alsa-project.org>
From: Charles Keepax via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, daniel.baluta@gmail.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92071F80155; Tue, 18 Apr 2023 10:38:39 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E3355F800F8
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 10:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3355F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=O1uzvMyS
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33I50ujp014943;
	Tue, 18 Apr 2023 03:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=QIGOwCnoD9saG41Ua74ZCdSTXr1oUGK7HY9sOWvvMSg=;
 b=O1uzvMyS9wYrgoEollZhxJd4gzViZuXEz/l01QmpxK3VoVfzGVW1rxKEc707uiqAhk4B
 bhrD0UFfP9l0WRNLgHDD1PDwl7krW/dOLXz2fLKfXf9ahKzLoYgrU2FxQsvRnGDV2xn0
 dcFLk2ZCzS7yzjds5gjDC0Le8xNaIGhTEQKBk4ypaBcxdLsuPd7QPgr5v8dGQ7cXQ6O7
 DzSjMrXZT9pksHxG0yDZKS8XO7PEP7E3655AXlwMQSHHb16a/FA3bQNelerU9x09Z7el
 nnfglIRePSH/bEzlV3sZECNOmu+m7eONvowFawZUvcL58XETDtR3+Q144hVhEejYnEUU 1Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pyrbpwuk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 03:38:31 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 18 Apr
 2023 03:38:30 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 18 Apr 2023 03:38:30 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E959445D;
	Tue, 18 Apr 2023 08:38:29 +0000 (UTC)
Date: Tue, 18 Apr 2023 08:38:29 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Saalim Quadri <danascape@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: wm8728: Convert to dtschema
Message-ID: <20230418083829.GA68926@ediswmail.ad.cirrus.com>
References: <20230417204323.137681-1-danascape@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230417204323.137681-1-danascape@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 1_gKeb4A7u8aGsCnr1sCts4zPnKAP3QN
X-Proofpoint-ORIG-GUID: 1_gKeb4A7u8aGsCnr1sCts4zPnKAP3QN
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: L27OTKKT6FBQOUU3K7Y33MZPWDQRNZMQ
X-Message-ID-Hash: L27OTKKT6FBQOUU3K7Y33MZPWDQRNZMQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L27OTKKT6FBQOUU3K7Y33MZPWDQRNZMQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 17, 2023 at 08:43:23PM +0000, Saalim Quadri wrote:
> Convert the WM8728 audio CODEC bindings to DT schema
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
