Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04657765FE1
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 00:47:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 270811DD;
	Fri, 28 Jul 2023 00:46:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 270811DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690498039;
	bh=bZgCYDFF558H9+uGABOoX1/6Falrihq1b+s55TkP1Rc=;
	h=Date:Subject:From:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OMXg5iPrea4qlbOl4YFGSRfF9UCYPQ0n3Gj/gpxYNq0enGf4uGYeEVCr3rdvQXBRY
	 ufAGnW5nJvCi7ov7hOsCUQc/wWmof9dggLPwn7/QUK8uDfA60EIMsr9z4vXlGYL9h3
	 phMpQR9C2syulJgv6mATsxPMc01rnQq9fOYs9VHI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 791F2F80310; Fri, 28 Jul 2023 00:46:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8BF3F80163;
	Fri, 28 Jul 2023 00:46:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AED24F8019B; Fri, 28 Jul 2023 00:46:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 745ADF800D2
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 00:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 745ADF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=3p4mB6hS
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-58473c4f629so7388037b3.1
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jul 2023 15:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690497975; x=1691102775;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+xSxR3hp/I+0TJm3Gw1q3yDgLZR8du1mEjkS4CS9C3Y=;
        b=3p4mB6hS4bB4DjFvuA8AjBwm5q5y+9Rzo3bKtgHjsDBsRvfkB/zxRokoM6g5pNE/r/
         ZnvKnqADVXicY1zIdf1mIprFzlLZImIXH/CI0gtSf2ESS1Z/gZYWL+ArRYrb1YIZUMSD
         mqlsU25BuAOrvimQaJpZ08nOy4tHf6aQQSFHSU/YU6HpRljTxIg5nDzc51mMJc3On4pJ
         64Vx2T9bnQutSKVxTtf0+xyW6SO/QUumDNILCURJWyNR1tewKdbLlTqGU9Cju7temypD
         L90tLrBo5GwqkwwwM0PC2+/H8f8qPtaM/j9HpULrmpfBJfIF9O2PBwZxWbEpTb/MOFCA
         2aXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690497975; x=1691102775;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+xSxR3hp/I+0TJm3Gw1q3yDgLZR8du1mEjkS4CS9C3Y=;
        b=CvqlauJYPn/uW+al+zzQVPTkNwXykr07TE/gaJBLOT4/hYUB7IKeiPXF8yvhmq5w/G
         7OWWXTYWykhnnTJzmjJ5fBUiyZAPJ/zXA6LkdxQupTbOiBSOIlTOFYSjwoEQOOp5YqaK
         rpWeabRQQAvJp7aF6x5xotauVF2/YG5pzQJ5jmB0u2fVKn+mm3nN7VOLszOV3zU7dpcu
         /bbJwlGX7UfvOz0/t6Kyi0T2N44Gz381v0FNO309+tS/ytzySxl12zGJ525//SpdBJyd
         gAkA1X5w5wjeGLOu0q5KntFiqvAbo1fHDQB9Z1QbpAIzWtuPymdZyrBFqd4pmswNHJQG
         tmYA==
X-Gm-Message-State: ABy/qLbFIpIkW8QTakF0NOpD+xUw1YjHZois4tOO8JKvtN7GacZ4jbyn
	4XASHL+jaOkfF/bygY2HehrEa6ueJELkdx0BAw==
X-Google-Smtp-Source: 
 APBJJlFtIfNRWhxKI9ReVlZVrIdSJVbc68FHmf1QrwaTAqeS7qwdelvTuwenzmSR6B4vHHVO4ceb+3rUp6w8zZjxvA==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:c58a:0:b0:d07:9d79:881c with SMTP
 id v132-20020a25c58a000000b00d079d79881cmr4ybe.11.1690497974749; Thu, 27 Jul
 2023 15:46:14 -0700 (PDT)
Date: Thu, 27 Jul 2023 22:46:13 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALTzwmQC/x2MywqAIBAAfyX2nGD2kPqV6GDrVnvRcCkC6d+TL
 gNzmMkglJgEpipDopuFYyjS1BXg4cJOin1xMNq02hqrJF7BF6LC6AlFjZ3dcB37dnAWSnYm2vj
 5l/Pyvh9K+aHLYgAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690497974; l=2418;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=bZgCYDFF558H9+uGABOoX1/6Falrihq1b+s55TkP1Rc=;
 b=RXhH5b4I6Sx8dSLpV7dWRHWahWzUnLIfmT5bv+HNz20DE0PdQ7UaHD8k8TSZLqjCeBJjEBK26
 QNpKX4HQNG5ANdl4Q781Tn39kh8DTU+nTEgSo6JdYZ3svnd/iWTQW6q
X-Mailer: b4 0.12.3
Message-ID: <20230727-sound-soc-codecs-v1-1-562fa2836bf4@google.com>
Subject: [PATCH] ASoC: 88pm860x: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Kees Cook <keescook@chromium.org>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: T56LBSU4X7RCIPLJR7B7R5XHODPYYUHX
X-Message-ID-Hash: T56LBSU4X7RCIPLJR7B7R5XHODPYYUHX
X-MailFrom: 
 3tvPCZAsKCtUALJK9EJK9KK7FF7C5.3FD1CJ1-45M5C1CJ1-GIFA53K.FI7@flex--justinstitt.bounces.google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T56LBSU4X7RCIPLJR7B7R5XHODPYYUHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

A suitable replacement is `strscpy` [2] due to the fact that it
guarantees NUL-termination on its destination buffer argument which is
_not_ always the case for `strncpy`!

In this case, though, there was care taken to ensure that the
destination buffer would be NUL-terminated. The destination buffer is
zero-initialized and each `pm860x->name[i]` has a size of
`MAX_NAME_LENGTH + 1`. This means that there is unlikely to be a bug
here.

However, in an attempt to eliminate the usage of the `strncpy` API as
well as disambiguate implementations, replacements such as: `strscpy`,
`strscpy_pad`, `strtomem` and `strtomem_pad` should be preferred.

We are able to eliminate the need for `len + 1` since `strscpy`
guarantees NUL-termination for its destination buffer as per its
implementation [3]:

|       /* Hit buffer length without finding a NUL; force NUL-termination. */
|       if (res)
| 	        dest[res-1] = '\0';

[1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
[2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html
[3]: https://elixir.bootlin.com/linux/v6.3/source/lib/string.c#L183

Link: https://github.com/KSPP/linux/issues/90
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 sound/soc/codecs/88pm860x-codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/88pm860x-codec.c b/sound/soc/codecs/88pm860x-codec.c
index 3574c68e0dda..d99b674d574b 100644
--- a/sound/soc/codecs/88pm860x-codec.c
+++ b/sound/soc/codecs/88pm860x-codec.c
@@ -143,7 +143,7 @@ struct pm860x_priv {
 	struct pm860x_det	det;
 
 	int			irq[4];
-	unsigned char		name[4][MAX_NAME_LEN+1];
+	unsigned char		name[4][MAX_NAME_LEN];
 };
 
 /* -9450dB to 0dB in 150dB steps ( mute instead of -9450dB) */
@@ -1373,7 +1373,7 @@ static int pm860x_codec_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 		pm860x->irq[i] = res->start + chip->irq_base;
-		strncpy(pm860x->name[i], res->name, MAX_NAME_LEN);
+		strscpy(pm860x->name[i], res->name, MAX_NAME_LEN);
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,

---
base-commit: 57012c57536f8814dec92e74197ee96c3498d24e
change-id: 20230727-sound-soc-codecs-947fcb9536a7

Best regards,
--
Justin Stitt <justinstitt@google.com>

