Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FE97C949B
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 14:29:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C638A4D;
	Sat, 14 Oct 2023 14:28:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C638A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697286578;
	bh=z/uk9iKCL369RTCKeFtmFdjunlHhSSwTEEHUs+T4/jk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ha9sXgCx/GshClf/9mo561Oyaus+8iN5rqsaGwG9kE9OsBfq6RUxl5gwO9gj1/dyB
	 rds5MO1ajpfoertJYA6MRDUGKzOx6o1uwS7+MO/QrRr1y9tl3NtwScDrYE2Vtcpmyz
	 lRdkUxiqPr+dCy0ou4OsX5T/oXQn1p1aoWrkEtnQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC82CF80558; Sat, 14 Oct 2023 14:28:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D2F4F8027B;
	Sat, 14 Oct 2023 14:28:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4580F802BE; Sat, 14 Oct 2023 14:28:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 432B0F8015B
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 14:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 432B0F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VcycMUnR
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E53A40007;
	Sat, 14 Oct 2023 12:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697286488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a9XWZXpgg0IYDBQKWd/5ZFV4pkk41cAYnPsgXLOB+Kk=;
	b=VcycMUnRVyvTNE7CsMfA/w4Vvbxn172rSLlrFfFG43MKlBLvPbbwTijP6ec6OCaPqZHIKL
	syOAL92KFdVrsWVJGnZ5dtdjJ/xejoOCSPU+aKEiqPJ6tLsTwTQZw9+MkLXNz41RUgEuuS
	79xJxyI9svEpKDDGURHl9+ljI6fDzO7ydhmDBsCLy34NBCPIeL5ZlVMfmkYjb0avaL9Sms
	tRzgaIyGOh/wGmIZ6Jc/Uvwn5pL4E0EKYDHtdhnQ5j4jz0QZYG87tXQGfMXambkdi1I3sf
	X7hbLjp1gzB/137koSGquWqCWW8C1bGCeLg6l/O95gxJbRIPWoDNnBMNzCMGiA==
Date: Sat, 14 Oct 2023 14:28:03 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: wangweidong.a@awinic.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, shumingf@realtek.com, rf@opensource.cirrus.com,
 arnd@arndb.de, 13916275206@139.com, ryans.lee@analog.com,
 linus.walleij@linaro.org, ckeepax@opensource.cirrus.com, fido_max@inbox.ru,
 sebastian.reichel@collabora.com, colin.i.king@gmail.com,
 liweilei@awinic.com, trix@redhat.com, dan.carpenter@linaro.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1 2/3] ASoC: codecs: Add code for bin parsing
 compatible with aw88399
Message-ID: <20231014142803.43f2aa9b@bootlin.com>
In-Reply-To: <20231013104220.279953-3-wangweidong.a@awinic.com>
References: <20231013104220.279953-1-wangweidong.a@awinic.com>
	<20231013104220.279953-3-wangweidong.a@awinic.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: UJPTSCFREKGT2XPYO5TC4WN4WFZQSVCA
X-Message-ID-Hash: UJPTSCFREKGT2XPYO5TC4WN4WFZQSVCA
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UJPTSCFREKGT2XPYO5TC4WN4WFZQSVCA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Weidong,

On Fri, 13 Oct 2023 18:42:19 +0800
wangweidong.a@awinic.com wrote:

> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Add aw88399 compatible code to the aw88395_lib.c file
> so that it can parse aw88399's bin file.
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  sound/soc/codecs/aw88395/aw88395_lib.c | 3 +++
>  sound/soc/codecs/aw88395/aw88395_reg.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/sound/soc/codecs/aw88395/aw88395_lib.c b/sound/soc/codecs/aw88395/aw88395_lib.c
> index 87dd0ccade4c..692ad9fa65a6 100644
> --- a/sound/soc/codecs/aw88395/aw88395_lib.c
> +++ b/sound/soc/codecs/aw88395/aw88395_lib.c
> @@ -702,6 +702,7 @@ static int aw_dev_load_cfg_by_hdr(struct aw_device *aw_dev,
>  	}
>  
>  	switch (aw_dev->chip_id) {
> +	case AW88399_CHIP_ID:

Just a nitpick here.
You can use the same 'switch case' order as for the other 'switch cases' below.
I mean
   case AW88395_CHIP_ID:
   case AW88399_CHIP_ID:

With that done:
Reviewed-by: Herve Codina <herve.codina@bootlin.com>

>  	case AW88395_CHIP_ID:
>  		ret = aw88395_dev_cfg_get_valid_prof(aw_dev, *all_prof_info);
>  		if (ret < 0)
> @@ -791,6 +792,7 @@ static int aw_get_dev_scene_count_v1(struct aw_device *aw_dev, struct aw_contain
>  
>  	switch (aw_dev->chip_id) {
>  	case AW88395_CHIP_ID:
> +	case AW88399_CHIP_ID:
>  		for (i = 0; i < cfg_hdr->ddt_num; ++i) {
>  			if ((cfg_dde[i].data_type == ACF_SEC_TYPE_MULTIPLE_BIN) &&
>  			    (aw_dev->chip_id == cfg_dde[i].chip_id) &&
> @@ -832,6 +834,7 @@ static int aw_get_default_scene_count_v1(struct aw_device *aw_dev,
>  
>  	switch (aw_dev->chip_id) {
>  	case AW88395_CHIP_ID:
> +	case AW88399_CHIP_ID:
>  		for (i = 0; i < cfg_hdr->ddt_num; ++i) {
>  			if ((cfg_dde[i].data_type == ACF_SEC_TYPE_MULTIPLE_BIN) &&
>  			    (aw_dev->chip_id == cfg_dde[i].chip_id) &&

[...]


Best regards,
Hervé
