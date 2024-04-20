Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE6E8AB81D
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Apr 2024 02:27:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74A5DB65;
	Sat, 20 Apr 2024 02:26:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74A5DB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713572820;
	bh=SNHtumGqvwr1lZZ9ZIBoUzL+sDV4Ix/gONciePeUyFQ=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=E/fSMy3rT6fpAO+caquR2cSRkcf37w9pU7j13p0kOXP+xL2dRhw4tUCTeYP4mfKz7
	 CpFhXRMg35u6FhNGqTT0LqxVrgW1ow8Fmsc67clG2iDJoT563+OU0CtpNd9yGqNh+8
	 JqXZn3ZmIJK/u1FT/KYVlMQBN9uWzdGX/GAvwbeE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14AE4F805AE; Sat, 20 Apr 2024 02:26:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8F4EF8057A;
	Sat, 20 Apr 2024 02:26:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02EE9F8025A; Sat, 20 Apr 2024 02:26:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 572A1F8003A
	for <alsa-devel@alsa-project.org>; Sat, 20 Apr 2024 02:26:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 572A1F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AEm/Al3Y
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DF6EACE1AD8;
	Sat, 20 Apr 2024 00:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EADCC072AA;
	Sat, 20 Apr 2024 00:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713572768;
	bh=SNHtumGqvwr1lZZ9ZIBoUzL+sDV4Ix/gONciePeUyFQ=;
	h=From:Date:Subject:To:Cc:From;
	b=AEm/Al3Y/lnCA+rSEpzUsw4YwQhg/ziHfeBnNKMZES2l/oTN6jgFoHXoSDtLHENV9
	 JXOQ8fhGhoAuDY9gtQOhywd3/E3ziE+UA8MZf5etYR3i/KR8FTyHA7ksvWGfucF49J
	 dchf5VO1G205lcgriReHdAaQVJcrZPisLHcghAI3ZopYP8zDy0+qIX6cyGZOg5j7Zx
	 SA67BTjIgaYTMycak/czUUoqflfJUo1UsQmRzxJ+gsgd7vjtOK3SI6mQSyNWX60f2n
	 ytTmrrvNTncjjocd5bXRENxtDKcWB5BK2Pgh57eplVylQN6/7f8r3R6eP2m+H4+vK7
	 nnrMP/8tj0C3Q==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 19 Apr 2024 17:25:59 -0700
Subject: [PATCH] ALSA: scarlett2: Zero initialize ret in
 scarlett2_ag_target_ctl_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240419-alsa-scarlett2-fix-wsometimes-uninitialized-v1-1-e2ace8642e08@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJYLI2YC/x2NwQrCMBAFf6Xs2YU2pEr9FfGwNlt9kKaSTVUs/
 XeDx4FhZiPTDDU6NxtlfcGwpArdoaHxIemujFCZXOt867uBJZqwjZKjluJ4wofftsxaMKvxmpB
 QIBFfDRy8n07Hfrj1TqgWn1mr/79drvv+AwrggP19AAAA
To: g@b4.vu, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 llvm@lists.linux.dev, patches@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2182; i=nathan@kernel.org;
 h=from:subject:message-id; bh=SNHtumGqvwr1lZZ9ZIBoUzL+sDV4Ix/gONciePeUyFQ=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGnK3PNfz9zypEevTnzlgnVzA4XzFG9yRk6znZqwytkwN
 4cj4sirjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjARppsM/0vv6EtNt//fbKsl
 bbKjU+s9c9vhRc9tf5Wf4rYWkKlQaWf4p2QwYUvLteTCux/NXki83FQ47cf3nS7NxZ43xf5xuWq
 VcwIA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
Message-ID-Hash: OJPJJDHCG2PZDVWPHDUTK7R554ZCL3XW
X-Message-ID-Hash: OJPJJDHCG2PZDVWPHDUTK7R554ZCL3XW
X-MailFrom: nathan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OJPJJDHCG2PZDVWPHDUTK7R554ZCL3XW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Clang warns (or errors with CONFIG_WERROR):

  sound/usb/mixer_scarlett2.c:3697:6: error: variable 'err' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
   3697 |         if (private->autogain_updated) {
        |             ^~~~~~~~~~~~~~~~~~~~~~~~~
  sound/usb/mixer_scarlett2.c:3707:9: note: uninitialized use occurs here
   3707 |         return err;
        |                ^~~
  sound/usb/mixer_scarlett2.c:3697:2: note: remove the 'if' if its condition is always true
   3697 |         if (private->autogain_updated) {
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  sound/usb/mixer_scarlett2.c:3688:9: note: initialize the variable 'err' to silence this warning
   3688 |         int err;
        |                ^
        |                 = 0
  1 error generated.

Initialize ret to zero to ensure ret is initialized in all paths within
scarlett2_ag_target_ctl_get(), which matches the style of other
functions in this driver.

Fixes: e30ea5340c25 ("ALSA: scarlett2: Add autogain target controls")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
FWIW, a lot of the functions that end in just 'mutex_unlock()' before
returning could probably benefit from the cleanup.h infrastructure,
which would help with the scope of err in this particular function, but
I decided to go with the most minimal fix here.
---
 sound/usb/mixer_scarlett2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index a2de31a0371b..b251d25f2a85 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -3685,7 +3685,7 @@ static int scarlett2_ag_target_ctl_get(
 	struct usb_mixer_elem_info *elem = kctl->private_data;
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct scarlett2_data *private = mixer->private_data;
-	int err;
+	int err = 0;
 
 	mutex_lock(&private->data_mutex);
 

---
base-commit: 32cb23a0f911317cdb5030035e49a204aa86fef5
change-id: 20240419-alsa-scarlett2-fix-wsometimes-uninitialized-d44f7659b52a

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

