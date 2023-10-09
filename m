Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E97607BED4E
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 23:25:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 014F5EDC;
	Mon,  9 Oct 2023 23:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 014F5EDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696886731;
	bh=WDmw1Lkn0054EpRVmv+kdxletOsKLERQEoDJyoxjqdU=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=T2TXNhKQL1bijqfgE+ZptCM8nwiVetVH9isFHOJmzqMX/NMIikWOH+soqCpXdqrCD
	 P4BBpBfvkxz8EUxiaL2r1R2vp+Up/yZnDHWSllPJ7qvdTy++1oTBfL7DMLo0SFRiGT
	 hPlDaCNNqvq9J7xC6uDhzJcSTgRbn1xGDoRQaZUM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88B47F80536; Mon,  9 Oct 2023 23:24:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 451F9F8027B;
	Mon,  9 Oct 2023 23:24:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBA5EF802BE; Mon,  9 Oct 2023 23:24:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19C6BF80166
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 23:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19C6BF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BiPv9zXm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 27438B817CA;
	Mon,  9 Oct 2023 21:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F99C433C8;
	Mon,  9 Oct 2023 21:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696886667;
	bh=WDmw1Lkn0054EpRVmv+kdxletOsKLERQEoDJyoxjqdU=;
	h=Date:From:To:Cc:Subject:From;
	b=BiPv9zXmszOBPcmG48Mh6TvipxEcahZxzlDRsWXYqdepL9wT7+Vn8qAY5HJ7EjURU
	 Qln+pgHxDCTi2UPs4OET/5c7iJUUFCiRHO9JGLHWFpXYeO5YDncD9yWizhmwYXue9h
	 nv1dAFqV9lXnXi/h4ohvwqR4qqVOtG6G374XjNxV8VpxEECu5li51qs8W1IzE9gpR6
	 E0Gksfg2Bm2vezhEWB4DcWlumpOW4kh5lq2tdYpBu0CQipPowOJtsU2v83LznaUWVe
	 tWcDxfnoLtKHEtcaYW2Q3uimxCCZ5mwulbBSf0j4vWVnkisSiIP2YHWmc9JWBe1U5m
	 /QHaWN9cUcofg==
Date: Mon, 9 Oct 2023 15:24:23 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] ASoC: sigmadsp: Add __counted_by for struct
 sigmadsp_data and use struct_size()
Message-ID: <ZSRvh1j2MVVhuOUv@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: TGQ4KOSGJCY6QX6JYOS2MUMX5WNKCPPJ
X-Message-ID-Hash: TGQ4KOSGJCY6QX6JYOS2MUMX5WNKCPPJ
X-MailFrom: gustavoars@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TGQ4KOSGJCY6QX6JYOS2MUMX5WNKCPPJ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

While there, use struct_size() and size_sub() helpers, instead of the
open-coded version, to calculate the size for the allocation of the
whole flexible structure, including of course, the flexible-array
member.

This code was found with the help of Coccinelle, and audited and
fixed manually.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 sound/soc/codecs/sigmadsp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
index b93c078a8040..56546e2394ab 100644
--- a/sound/soc/codecs/sigmadsp.c
+++ b/sound/soc/codecs/sigmadsp.c
@@ -43,7 +43,7 @@ struct sigmadsp_data {
 	uint32_t samplerates;
 	unsigned int addr;
 	unsigned int length;
-	uint8_t data[];
+	uint8_t data[] __counted_by(length);
 };
 
 struct sigma_fw_chunk {
@@ -270,7 +270,7 @@ static int sigma_fw_load_data(struct sigmadsp *sigmadsp,
 
 	length -= sizeof(*data_chunk);
 
-	data = kzalloc(sizeof(*data) + length, GFP_KERNEL);
+	data = kzalloc(struct_size(data, data, length), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
@@ -413,7 +413,8 @@ static int process_sigma_action(struct sigmadsp *sigmadsp,
 		if (len < 3)
 			return -EINVAL;
 
-		data = kzalloc(sizeof(*data) + len - 2, GFP_KERNEL);
+		data = kzalloc(struct_size(data, data, size_sub(len, 2)),
+			       GFP_KERNEL);
 		if (!data)
 			return -ENOMEM;
 
-- 
2.34.1

