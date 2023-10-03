Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D477B6D5A
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 17:42:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93BCA9F6;
	Tue,  3 Oct 2023 17:41:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93BCA9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696347729;
	bh=d7FUz7zAhexj9cG0im64UlEZt4Rl2wqiWM7EahiKgPw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OqxGa13wtIm6pRgGftYyNph6nUMtCX7fRQL9U2UsSY9iK0QQvjtadj8J6KSlnUedR
	 fWcK0Q+QwZgU7Blgx5BH8gFVrBAOEUc/GzHSYjBuYRvKaepeQLYcECZjS6NmKzlx06
	 JKMcLI+imspOn2r7whPupEs+tPGe5nO2SQYtqEn4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEF5FF8047D; Tue,  3 Oct 2023 17:41:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BA02F80310;
	Tue,  3 Oct 2023 17:41:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B0F5F80166; Tue,  3 Oct 2023 17:41:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5B27F801EB
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 17:41:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5B27F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=lTw3NXXi
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 393Fc9sj015864;
	Tue, 3 Oct 2023 10:41:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=UshK4TaSVNwezbB
	N5bZqdstEY08K/OpsJKNbQZ06nDM=; b=lTw3NXXiu9vCFDQC8FUVJfBGl0U7o9O
	EXXjBYMvqt9vwafgJNDzRni6TQ8+Ito7iK6rZpG4I5OA1mdfT7G8TrPPXm57Uiuo
	MS3chEgxyaIHGhjWOPbPY3FM5JSFa/i2nle4cfPz3b9HnsRZzrGrfcrO6jgyvJ4C
	8eiifCQk9nbQVHdDAXkAtQd5P0C5px6hV833qqlfzEbBb6Ud7ao9QkSn1PyRqSu8
	vFzDXW/1Itjq2K3L8CvUEBsaFwM0H2h0dhF5BTx75t41OxZp+o1BC1uyGlu3aH0J
	eFlel6o99zgIOND5/mDebJ8NEDcYvpe8VbGKbMSXI2wYkHBka5Bvvmw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3teg3k45p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Oct 2023 10:41:08 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 3 Oct
 2023 16:41:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 3 Oct 2023 16:41:06 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 758973563;
	Tue,  3 Oct 2023 15:41:06 +0000 (UTC)
Date: Tue, 3 Oct 2023 15:41:06 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko
	<andy@kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        James Schulman <james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH 21/36] pinctrl: cirrus: use new pinctrl GPIO helpers
Message-ID: <20231003154106.GO103419@ediswmail.ad.cirrus.com>
References: <20231003145114.21637-1-brgl@bgdev.pl>
 <20231003145114.21637-22-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231003145114.21637-22-brgl@bgdev.pl>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: qEOvuBdeYuub8KOOHydplmKS4-sTIHHr
X-Proofpoint-ORIG-GUID: qEOvuBdeYuub8KOOHydplmKS4-sTIHHr
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VZUIC7VQF42FEXRYDX7MBVZH7WV6QFLX
X-Message-ID-Hash: VZUIC7VQF42FEXRYDX7MBVZH7WV6QFLX
X-MailFrom: prvs=5640c5b1eb=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VZUIC7VQF42FEXRYDX7MBVZH7WV6QFLX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Oct 03, 2023 at 04:50:59PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Replace the pinctrl helpers taking the global GPIO number as argument
> with the improved variants that instead take a pointer to the GPIO chip
> and the controller-relative offset.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
