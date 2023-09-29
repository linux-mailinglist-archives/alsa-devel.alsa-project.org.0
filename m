Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFED37B3766
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 18:00:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 103FEDEF;
	Fri, 29 Sep 2023 18:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 103FEDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696003250;
	bh=MnZquLPkDBkjKHQwlCsmfD9plASD37pKQYphc5bm4a0=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pCEFFUapyj4HSEKdSCdsa5hw0EkfDL5+1mY52ijAyidkEjUXuWMvHAi58TysjeCfv
	 2F5cfhN1zuIfitq0NtEM5u8oYytH1M22nSLloEHVmiMU92yeA1oe9/0vYFxk7z5rqW
	 z1AsiDbWtKDFYzT/vdhFJ/VQh1yVv6kBmIomffh4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A058EF801D5; Fri, 29 Sep 2023 17:59:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B4BCF8016A;
	Fri, 29 Sep 2023 17:59:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2126F801D5; Fri, 29 Sep 2023 17:59:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D36B6F800AE
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 17:59:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D36B6F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ji33FVLv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 01D81B81E9D;
	Fri, 29 Sep 2023 15:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5B3C433C8;
	Fri, 29 Sep 2023 15:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696003169;
	bh=MnZquLPkDBkjKHQwlCsmfD9plASD37pKQYphc5bm4a0=;
	h=Date:From:To:Cc:Subject:From;
	b=Ji33FVLvtjef5TpdrXCXT+tOfwK7X6QqaDW/sSTW4uncDJ0ZD9QBIZRmOUQKsgWmN
	 QAMCATmVFijx8Ajh0KRMVLs4/Ie2iez01r2ZQyzhpaJR+MveEuei8hv1I1+AA1xmW3
	 4PH/aAAdF0p2YDAtLRE8dOPiriMcOvZcelN0alOaurtwQY6DGn94/ko5B/BINekQ74
	 IfRn7eWnesujGiT4JQEJYxfMUmcCRe8TLku3hCbeiZvI/IFBpvXE7FdC6PNebn/cwN
	 eOpJTyQLqnuKMSDxcxYEvvGb6KYot/hn7gOtIDSNOP8ZDBbsQUVchp6GoohIeN39cX
	 QDXFd3aOUztUg==
Date: Fri, 29 Sep 2023 17:59:22 +0200
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jussi Kivilinna <jussi.kivilinna@iki.fi>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] ALSA: 6fire: Fix undefined behavior bug in struct
 comm_runtime
Message-ID: <ZRb0WiViajjqcyKT@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 7ZQJCPSPQUPY3SBZV45VC7HDJY5ACTRC
X-Message-ID-Hash: 7ZQJCPSPQUPY3SBZV45VC7HDJY5ACTRC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ZQJCPSPQUPY3SBZV45VC7HDJY5ACTRC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

`struct urb` is a flexible structure, which means that it contains a
flexible-array member at the bottom. This could potentially lead to an
overwrite of the objects following `receiver` in `struct comm_runtime`,
among them some function pointers.

Fix this by placing the declaration of object `receiver` at the end of
`struct comm_runtime`.

Fixes: ddb6b5a96437 ("ALSA: 6fire: fix DMA issues with URB transfer_buffer usage")
Cc: stable@vger.kernel.org
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 sound/usb/6fire/comm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/6fire/comm.h b/sound/usb/6fire/comm.h
index 2447d7ecf179..ee81572a4eec 100644
--- a/sound/usb/6fire/comm.h
+++ b/sound/usb/6fire/comm.h
@@ -19,7 +19,6 @@ enum /* settings for comm */
 struct comm_runtime {
 	struct sfire_chip *chip;
 
-	struct urb receiver;
 	u8 *receiver_buffer;
 
 	u8 serial; /* urb serial */
@@ -30,6 +29,7 @@ struct comm_runtime {
 	int (*write8)(struct comm_runtime *rt, u8 request, u8 reg, u8 value);
 	int (*write16)(struct comm_runtime *rt, u8 request, u8 reg,
 			u8 vh, u8 vl);
+	struct urb receiver;
 };
 
 int usb6fire_comm_init(struct sfire_chip *chip);
-- 
2.34.1

