Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E8C78C203
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 12:09:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EBC984C;
	Tue, 29 Aug 2023 12:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EBC984C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693303753;
	bh=Moag6rzrYBe01Lwocmd8IjZ4aQgIJAzstJmy4IJpY2Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UvpIwUrTnog4mq0Rc4Sb0E/Pm6jte2AgSDtaiLFNHeo2+DRmAWtGQXLYHcf4ZY6we
	 rfvkgWjcpAoBJLVDlxb5WVnG5Xdv8GvtJNu9MJAMO97ZqKIzyGun6sc3UCe1ueI0jF
	 4KoflK6GcwmUqm5FJbFiZcX2QNnU8c0FeysdDaKg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6217F8032D; Tue, 29 Aug 2023 12:08:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53821F80155;
	Tue, 29 Aug 2023 12:08:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1C6CF80158; Tue, 29 Aug 2023 12:07:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC065F800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 12:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC065F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=jqBV8I3U
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37T6KCjL026471;
	Tue, 29 Aug 2023 05:07:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=z1RQfP43eBCqL73
	eA2MB/sNoJpbcTwlKRFoBytkuupI=; b=jqBV8I3U2mJHgcJffsC3uptwGX0PQdd
	tD56XEcuLR2PhInwT3kdfyVY6mKkzpDxEnYxVHDTZsLrjMBN/cAux9WiiIn5oExJ
	1C+y8+BQtdxOCL1uJxeeqeVwNN1s5Gi87yK7zegSvw9XKcNYmCs5+oJHb0chO1lC
	rp1f7R+6iuEPlu5O++zPbpU9XFlaTSJjJbWjsFiGoNkPLSSaEk21qG5PlkVCFgJ4
	UiK7ffKMxjTWL4CvePbG5HHArNCrAjX8vSiojp7Fa3H3Ua2FvnY/PdH36Y+MMia9
	jdEB92mW7V2wJvrcGL8TnL5JucLfzG85+oYE8Y6W9Me84Yp1D1Qi/Gw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesybbqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 05:07:53 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 29 Aug
 2023 11:07:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Tue, 29 Aug 2023 11:07:51 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 893A315B6;
	Tue, 29 Aug 2023 10:07:51 +0000 (UTC)
Date: Tue, 29 Aug 2023 10:07:51 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring
	<robh+dt@kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <RicardoRivera-Matosricardo.rivera-matos@cirrus.com>,
        Ricardo Rivera-Matos
	<rriveram@opensource.cirrus.com>
Subject: Re: [PATCH 3/7] ASoC: cs35l45: Checks index of cs35l45_irqs[]
Message-ID: <20230829100751.GR103419@ediswmail.ad.cirrus.com>
References: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
 <20230828170525.335671-3-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230828170525.335671-3-vkarpovi@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: M74-QEiMxqO8VazLA0J-t908_Gpd4Ycv
X-Proofpoint-GUID: M74-QEiMxqO8VazLA0J-t908_Gpd4Ycv
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GEKK6Z5GJGL4QVM446QLWWOUFQN4CC2B
X-Message-ID-Hash: GEKK6Z5GJGL4QVM446QLWWOUFQN4CC2B
X-MailFrom: prvs=4605abc1a5=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GEKK6Z5GJGL4QVM446QLWWOUFQN4CC2B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 28, 2023 at 12:05:21PM -0500, Vlad Karpovich wrote:
> Checks the index computed by the virq offset before printing the
> error condition in cs35l45_spk_safe_err() handler.
> 
> Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
> Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
> ---
>  sound/soc/codecs/cs35l45.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
> index 40fb64904260..2c9b41171a05 100644
> --- a/sound/soc/codecs/cs35l45.c
> +++ b/sound/soc/codecs/cs35l45.c
> @@ -1023,7 +1023,10 @@ static irqreturn_t cs35l45_spk_safe_err(int irq, void *data)
>  
>  	i = irq - regmap_irq_get_virq(cs35l45->irq_data, 0);
>  
> -	dev_err(cs35l45->dev, "%s condition detected!\n", cs35l45_irqs[i].name);
> +	if (i < 0 || i > 6)

This looks a little odd, there appear to be 8 IRQs attached to
this function whereas this says 6. Also this check seems like
it will be hard to keep in sync as things change.

Assuming this error check is actually necessary, would it be
perhaps better to check i is smaller than ARRAY_SIZE(cs35l45_irqs)
and check that the attached function is cs35l45_spk_safe_err.
That should be more robust against future changes to the IRQs.

Thanks,
Charles
