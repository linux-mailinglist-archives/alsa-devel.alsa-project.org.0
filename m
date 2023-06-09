Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CEB728C83
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 02:35:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC99E10E;
	Fri,  9 Jun 2023 02:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC99E10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686270899;
	bh=y2qs56+NIzYXecsSNT6PSJJdJCchiBHgIme/dNJBV8g=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AGqNBdRrEjYQBzHXgThpS1hV+6oxOGa6ZPKo0tsJOxyJsDo6WDO+R7uNSmRGqKyyb
	 WYdiRidLrSfN7jZeeo/7NRH/aBfwMxOel5jinUAV29zO+wOYOSvfn6erEBFyaxEz7S
	 wv8/TNyuk+J5P7QGSps5sInpGvzJNno//m49lHtA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 127CCF80520; Fri,  9 Jun 2023 02:34:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ADEAF8016C;
	Fri,  9 Jun 2023 02:34:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC0CDF80199; Fri,  9 Jun 2023 02:34:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D097F80130
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 02:33:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D097F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L7UEcWRk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=0Rw1O/Ld7Wl3HwzBCOw+clBcV9DuHYc4t50MtUeaKb4=; b=L7UEcWRkUQU0Iuz85CRZtBfsQD
	6bahg+uSfvIJu68F8seUMi6cIir/d4CriCLCB/DEFI5xIc2kTzhGd+0Pd+vw43PEx2DWir2sprMWs
	fecH4Fs8MsznzhcpzOFYoYSr0Fg52DD1rWJZXynLgbN0QNwq2WX+6TI+LgZkw5tzT+Vevh46lUD/l
	+/5fjyL2gqPQFL8qVCXwsJu1VT+w3YeoyHMZRc/2VY2JKaR3EBVZ7d9VYF0RlbfRf8EAhXOaQNRCI
	Ug4/qlnOY4MxAyAS4sdACqNrjYYL/E4MoCKy9tubJ3GJXhBbt51y583obo8X4SuFMHRjSz8SRwVAj
	ApOHY9Fw==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Q4X-00B4ww-2V;
	Fri, 09 Jun 2023 00:33:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: stac9766: fix build errors with REGMAP_AC97
Date: Thu,  8 Jun 2023 17:33:45 -0700
Message-Id: <20230609003345.15705-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JQGZ75AGZ6M7DILG5FIAK3ANAEW7EAIH
X-Message-ID-Hash: JQGZ75AGZ6M7DILG5FIAK3ANAEW7EAIH
X-MailFrom: rdunlap@infradead.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQGZ75AGZ6M7DILG5FIAK3ANAEW7EAIH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Select REGMAP_AC97 to fix these build errors:

ERROR: modpost: "regmap_ac97_default_volatile" [sound/soc/codecs/snd-soc-stac9766.ko] undefined!
ERROR: modpost: "__regmap_init_ac97" [sound/soc/codecs/snd-soc-stac9766.ko] undefined!

Fixes: 6bbf787bb70c ("ASoC: stac9766: Convert to regmap")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org
---
 sound/soc/codecs/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff -- a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1693,6 +1693,7 @@ config SND_SOC_STA529
 config SND_SOC_STAC9766
 	tristate
 	depends on SND_SOC_AC97_BUS
+	select REGMAP_AC97
 
 config SND_SOC_STI_SAS
 	tristate "codec Audio support for STI SAS codec"
