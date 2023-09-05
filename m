Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E760D792011
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 04:48:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D76817F1;
	Tue,  5 Sep 2023 04:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D76817F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693882110;
	bh=AaaNTTs/g5lOvpyrjnbgZ550unUjsNH819EjzuRD1b0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rQOWPpaz/qckiTywt/Rib+rZ1lze1OwrMrOeoZo+3tCpunoRO+LmPT/TIqYrTwHeT
	 g3qu2mF+nDmAlxNXTrV1zH1KXsPKentmGtnY+rySNXvGkAXZ7tYsZB+y1cRgA1CrSB
	 dEv1EittQHe1nffXvgEjxisY9B1TxCf7ZiYeeC0E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64F86F80494; Tue,  5 Sep 2023 04:47:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7204F80431;
	Tue,  5 Sep 2023 04:47:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9947BF8047D; Tue,  5 Sep 2023 04:47:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out28-122.mail.aliyun.com (out28-122.mail.aliyun.com
 [115.124.28.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40A32F80236
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 04:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40A32F80236
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.1763104|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0237881-0.00029532-0.975917;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047190;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.UXjJ.KH_1693882020;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.UXjJ.KH_1693882020)
          by smtp.aliyun-inc.com;
          Tue, 05 Sep 2023 10:47:03 +0800
From: wangweidong.a@awinic.com
To: krzysztof.kozlowski@linaro.org
Cc: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wangweidong.a@awinic.com,
	yijiangtao@awinic.com
Subject: Re: [PATCH 3/3] ASoC: aw88395: drop undocumented and unused
 sound-channel property
Date: Tue,  5 Sep 2023 10:46:59 +0800
Message-ID: <20230905024659.15071-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904125309.43350-3-krzysztof.kozlowski@linaro.org>
References: <20230904125309.43350-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A4H2DYXOFW5FZDDBRJ2VQJEZUXZDBA6L
X-Message-ID-Hash: A4H2DYXOFW5FZDDBRJ2VQJEZUXZDBA6L
X-MailFrom: wangweidong.a@awinic.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A4H2DYXOFW5FZDDBRJ2VQJEZUXZDBA6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you very much for the proposed patch, but I have some 
questions that I would like to discuss with you

On Mon, Sep 04, 2023 at 12:53 PM +0200, Krzysztof Kozlowski wrote:
> The Devicetree sound-channel property was never accepted and is not
> allowed by bindings.  It is not used by any upstream user, thus
> considering that it was never documented, should be dropped.

This node property is intended for use with multiple PA, to
load different configurations for different PA.
Can I add this sound-channel in the "awinic,aw88395.yaml" file?

> Even though it does not look like from the diff, the property is not
> actually used by the driver, because once set, it is read only in loops
> depending on ddt_num (prof_hdr->ddt_num, cfg_hdr->ddt_num).  The
> variable ddt_num is never set and is always 0, so the loops do not have
> any iteration.  Dropping sound-channel and ddt_num-related loops allows
> to drop empty functions which in turn drop quite a lot of code.  This
> entire code was not possible to execute. 

The ddt_num variable is not always 0, this variable is defined
in the configuration file. The "prof_hdr" variable is assigned by 
the "cfg_hdr" variable. The "cfg_hdr" variable is assigned by "aw_cfg"
aw_cfg is the data obtained through request_firmware.The specific 
process is as follows:

request_firmware ---> cont->data ---> aw_cfg->data --> cfg_hdr --> prof_hdr


> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

> Not tested on hardware... but feature removed here could not work
> according if conforming to documented interface.
---
>  sound/soc/codecs/aw88261.c                   |  13 -
>  sound/soc/codecs/aw88395/aw88395_data_type.h |   1 -
>  sound/soc/codecs/aw88395/aw88395_device.c    |  21 -
>  sound/soc/codecs/aw88395/aw88395_device.h    |   1 -
>  sound/soc/codecs/aw88395/aw88395_lib.c       | 788 -------------------
>  5 files changed, 824 deletions(-)

> diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
> index a5de7c704e73..e0527ce2f83e 100644
> --- a/sound/soc/codecs/aw88261.c
> +++ b/sound/soc/codecs/aw88261.c
> @@ -1171,17 +1171,6 @@ static void aw88261_hw_reset(struct aw88261 *aw88261)
>  	usleep_range(AW88261_1000_US, AW88261_1000_US + 10);
>  }

...

Best Regards,
Weidong Wang
