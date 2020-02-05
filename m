Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5677152772
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 09:15:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BDB51614;
	Wed,  5 Feb 2020 09:14:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BDB51614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580890539;
	bh=VBVl4XanJm7PtaEaIcanVf7HgYwXcz//WaFkMv/Z0Bc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F2mYMlGlybbcDvFaTlZDkZ6R6TQd55QTUNUEAu/NNxYya9ibZVCnSU/3WK+Hvjw0v
	 9UTYJb1JeVTwSYLo/0314/mlHVKn87eC9V67daD26sV1kVDhGvMJuu/hWatzM4ROX9
	 f5J5rppdoxLyfd8fx+CwUCM15HcbJ9ANiiAIpjYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7362F80278;
	Wed,  5 Feb 2020 09:12:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BF01F800E2; Wed,  5 Feb 2020 09:12:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AA12F80142
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 09:12:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AA12F80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mforney-org.20150623.gappssmtp.com
 header.i=@mforney-org.20150623.gappssmtp.com header.b="fJxIqivg"
Received: by mail-pj1-x1042.google.com with SMTP id ep11so647715pjb.2
 for <alsa-devel@alsa-project.org>; Wed, 05 Feb 2020 00:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=P8r21QMMGkJeSJhVb6hST1YZPwdoY3sIDKu+bNMCcJg=;
 b=fJxIqivgKiduf/CqgDhrRJoJnYt6nNLPiwVZn2m1krcv8vZcL1RfXaEpUZv9QI4Djo
 VZmSHRpEg5K32X41HvK5+M7FaLXJezSzEtfi1qYvT7mbWmA06N9YmfrlQKPVtIst7wYm
 z3qYODp3kHOEhB99XrHaIHIx2uzr2M0QNmRUG07U4/FfOzkedCu2IPC6xXir2GgC5cof
 x9aoXsjoEmoLwb/8HRQvLHnsr7cjiGmJevMGyhTByWz8QN5n/TiqWC1mKIW4C4svL8AG
 uJExS4tXGAfqfcmQTzzJcXjSYyHbzGZ3Ix8d1N0A8tc0tyPT57G/vc9dmNS04IU/Ch1P
 TzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P8r21QMMGkJeSJhVb6hST1YZPwdoY3sIDKu+bNMCcJg=;
 b=gHd9ql1CkBHHJ+cvomDNUleiD59dKUr220sacs7yWouaoveFOrR+18at+8V250+qNU
 buLOT3WQIds4w5xa345zvkp7s/lcfqliMdzVFVUYToGHKsRST0GzV5/+vC+X6LZhncIF
 AFwf1mpOaNIPRkqNtX/FoCB5TgKW6Xij9vCcECxkVQ/tC8kQLvAU7HPfEtrNGXtnP/N/
 Ql4ZJqMFWlqIS9ZIGNf9yM25OFXqqhIzhDJwnLdUY++SrCxMCKHd0IW7sAqH5VBZLnfS
 MZYm8mBZT2ekQ5USIliJ4gp/AxrgBZtYnQ8sbF4giTUZ5ihQFZlRdAjjdnw0sh6xQ7La
 qmuA==
X-Gm-Message-State: APjAAAWtOSyJIJ/yyzCjijEubjsOa5mp674dvU3skiOz2WFGJz3szgAI
 g6SAtzLC11QUiwcuwnqLBGVb/nxKDpHenA==
X-Google-Smtp-Source: APXvYqyo6PZjxQc7RKGvKwR1sZngDuo1cN4DRtivXtWuoN5GEmJzUQxtw08+yrrTmKGyS6IXxlAmcg==
X-Received: by 2002:a17:90a:9f83:: with SMTP id
 o3mr4232602pjp.95.1580890361287; 
 Wed, 05 Feb 2020 00:12:41 -0800 (PST)
Received: from localhost ([2601:647:5180:4570:16dd:a9ff:fee7:6b79])
 by smtp.gmail.com with ESMTPSA id p4sm14792502pgh.14.2020.02.05.00.12.40
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Feb 2020 00:12:40 -0800 (PST)
From: Michael Forney <mforney@mforney.org>
To: alsa-devel@alsa-project.org
Date: Wed,  5 Feb 2020 00:12:20 -0800
Message-Id: <20200205081221.18665-3-mforney@mforney.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200205081221.18665-1-mforney@mforney.org>
References: <20200205081221.18665-1-mforney@mforney.org>
MIME-Version: 1.0
Subject: [alsa-devel] [PATCH alsa-utils 3/4] Use %lli for long long in printf
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The `L` length modifier only applies to floating-point conversion
specifiers, and `ll` is used for `long long` integers.

Although glibc accepts %Li, musl does not and returns EINVAL.

Signed-off-by: Michael Forney <mforney@mforney.org>
---
 alsactl/state.c | 4 ++--
 amixer/amixer.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/alsactl/state.c b/alsactl/state.c
index 38e85c0..22e0269 100644
--- a/alsactl/state.c
+++ b/alsactl/state.c
@@ -336,9 +336,9 @@ static int get_control(snd_ctl_t *handle, snd_ctl_elem_id_t *id, snd_config_t *t
 		long long max = snd_ctl_elem_info_get_max64(info);
 		long long step = snd_ctl_elem_info_get_step64(info);
 		if (step)
-			sprintf(buf, "%Li - %Li (step %Li)", min, max, step);
+			sprintf(buf, "%lli - %lli (step %lli)", min, max, step);
 		else
-			sprintf(buf, "%Li - %Li", min, max);
+			sprintf(buf, "%lli - %lli", min, max);
 		err = snd_config_string_add(comment, "range", buf);
 		if (err < 0) {
 			error("snd_config_string_add: %s", snd_strerror(err));
diff --git a/amixer/amixer.c b/amixer/amixer.c
index 928f7c5..4c19a58 100644
--- a/amixer/amixer.c
+++ b/amixer/amixer.c
@@ -620,7 +620,7 @@ static int show_control(const char *space, snd_hctl_elem_t *elem,
 		       snd_ctl_elem_info_get_step(info));
 		break;
 	case SND_CTL_ELEM_TYPE_INTEGER64:
-		printf(",min=%Li,max=%Li,step=%Li\n", 
+		printf(",min=%lli,max=%lli,step=%lli\n",
 		       snd_ctl_elem_info_get_min64(info),
 		       snd_ctl_elem_info_get_max64(info),
 		       snd_ctl_elem_info_get_step64(info));
@@ -662,7 +662,7 @@ static int show_control(const char *space, snd_hctl_elem_t *elem,
 				printf("%li", snd_ctl_elem_value_get_integer(control, idx));
 				break;
 			case SND_CTL_ELEM_TYPE_INTEGER64:
-				printf("%Li", snd_ctl_elem_value_get_integer64(control, idx));
+				printf("%lli", snd_ctl_elem_value_get_integer64(control, idx));
 				break;
 			case SND_CTL_ELEM_TYPE_ENUMERATED:
 				printf("%u", snd_ctl_elem_value_get_enumerated(control, idx));
-- 
2.25.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
