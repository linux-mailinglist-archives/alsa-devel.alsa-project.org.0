Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A67252F126
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 18:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0395F1735;
	Fri, 20 May 2022 18:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0395F1735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653065812;
	bh=gr574qUgcbq3MCtPgynzNKObQz8m2bTmWuCGKzHJ8oE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M3oIiTDEh8NmmbwExYtJeR9pVBsBKEcoXd/YgHJRDmmu9xRPWdffavuM56OAoe+99
	 kQrDM8NuoaCZpFWMv8XvC5h1V2lWWMeYY3uwpXwSMiSoIpytVMT/IaUIZQtWIB2xl8
	 3O42E973WVvnXgu2jm4+Cp/S01SJu3it9s5wXRVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63F03F801F5;
	Fri, 20 May 2022 18:55:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62A54F8019D; Fri, 20 May 2022 18:55:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CCDBF800D2
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 18:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CCDBF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="chMw8Bbd"
Received: by mail-pl1-x636.google.com with SMTP id m1so7844953plx.3
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 09:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HImf2kaCG91lzQHnr8MRW3BphKAYkvqBRRs5ES2/Au0=;
 b=chMw8BbdMENO44Ex7To5iiOLh8gVzvLkcdwXIkjZhtLgjDmcw6bvH3pKV81xXyD1RT
 jaO2BDd6Ba12cdcRMcQWeQ3eTZhPw5pkToFSdosBNAEAA3xd7hoJfdOKEysEHf/EH7Gx
 PCTLhPtYCs/oxN3hQZ5CVWyNtXZRzsmr/2/UA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HImf2kaCG91lzQHnr8MRW3BphKAYkvqBRRs5ES2/Au0=;
 b=3PhPT1dIoxZiUW3R50W6JCf21fVd3VfRpRoVroDFw7Q4b9sBaqbcHKjX5uj0M9bzhp
 cntEAevU/V90qwHBMo20lk62LKSvqB7Exjnd7CEo/scICAY4Ybo5qqqluNdNoGEDPJQj
 SRYRoC5MTvlNx8VqTG2LQwICs1eTPWz31PREL1+5EwFqNH7X4Oea7dyWxY23RdnSaOua
 AIKCzTJ/zyjcPDuGieT6DHzGt8ujh3/63dbQ6X2H6JL/Jxfo82VIKvzHOOsewFPHnc7Z
 0ONyRWJelP9vW8N19B6SeWgR+WhP3Q070MWIjhsRwJya/wD54DckswQKpr5TMdzJky4v
 2yzg==
X-Gm-Message-State: AOAM533FKJXLy+WPZrJlxKE1++Hy/KHt828u1x1RVUNHCw9Jdj51E0jn
 KbUjpycOYPAWqeaVL0p0io4LAwbTVF+RyA==
X-Google-Smtp-Source: ABdhPJyPX/wiqqe3vp3/13uQvnlQZbUyGzIpvrkBOpe/APiP2oAzWvzYFRxJefLrl44crd3enNc2Lw==
X-Received: by 2002:a17:90b:4b83:b0:1df:6862:fa9d with SMTP id
 lr3-20020a17090b4b8300b001df6862fa9dmr12702530pjb.32.1653065741654; 
 Fri, 20 May 2022 09:55:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 bw1-20020a17090af60100b001dc37aef4ffsm2080789pjb.48.2022.05.20.09.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 09:55:41 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: lola: Bounds check loop iterator against streams array
 size
Date: Fri, 20 May 2022 09:55:37 -0700
Message-Id: <20220520165537.2139826-1-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1649; h=from:subject;
 bh=gr574qUgcbq3MCtPgynzNKObQz8m2bTmWuCGKzHJ8oE=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBih8gIIXIPk/P0F6PPAXfjj2YPCN4RrUGeVlJhNe5p
 dtIzbUCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYofICAAKCRCJcvTf3G3AJmiTD/
 wLZy4PXZmSaQfadLpeAOF1dQZVsrfP59bq6c3hU+T8kHRdZW3c7TalWO8SX+bZ//+7SVTcdJ3UJR4U
 5yQufY2Hu5aZ3SzEZieTedw2HeRQjSksM6BY86lsk7nCMQHsz1bv8ju2mh5JfscBmPxV8bCob83Wwc
 C3b38caQpgXXyLfO+4JnhaEdR/g+uSOpjCrr5pg2ibM3Yi+Ks51nX9fCaSnoDSJNVMv0ohoKHAYufC
 6Vy4KR5vmxqVQ04jKa6PvDUR6UWAMvY0HKqln8l4KCKO8Hk06Ehrr7JRssAxU08EXO1rdscVF2pNrX
 bko77kiex8R3J9GV2TvBRQDTc/ddYj+4wHdETAY/8Hd9S2lTQL6Iq+fgpLIPbas35gzm3xnpbBsdaO
 9j7QdWUXkSV85wipNjvYUpG2gQbi5cxtPr1CL4ejvZPUZs9L5TDQynWjmB2W6o29Ez8y08iCxy7Idv
 RcJhkyvvKw3vmG6ICncm8U2+yYyDIUywrft0CWriC3QZU9k90wdCdG310wVJEdfslQbXf8UgG3Hdbg
 quCgwW81cCh+SUGBw3NLNcOGx7VGJiQxvUMy9zKjVf4yuYbTSFpBNyhlLJM64JPCqxjTPw3iEIJ+Fx
 37ZyhnaW3/JAHRauPrgsKEEXoGT+jBZuCVfVRqe4eAn8MomlRYNQkFyb//NA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-hardening@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Takashi Iwai <tiwai@suse.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

GCC 12 sees that it's technically possible for num_streams to be larger
than ARRAY_SIZE(pcm->streams). Bounds-check the iterator.

../sound/pci/lola/lola_pcm.c: In function 'lola_pcm_update':
../sound/pci/lola/lola_pcm.c:567:64: warning: array subscript [0, 31] is outside array bounds of 'struct lola_stream[16]' [-Warray-bounds]
  567 |                         struct lola_stream *str = &pcm->streams[i];
      |                                                    ~~~~~~~~~~~~^~~
In file included from ../sound/pci/lola/lola_pcm.c:15:
../sound/pci/lola/lola.h:307:28: note: while referencing 'streams'
  307 |         struct lola_stream streams[MAX_STREAM_COUNT];
      |                            ^~~~~~~

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 sound/pci/lola/lola_pcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/lola/lola_pcm.c b/sound/pci/lola/lola_pcm.c
index 738ec987000a..32193fae978d 100644
--- a/sound/pci/lola/lola_pcm.c
+++ b/sound/pci/lola/lola_pcm.c
@@ -561,8 +561,9 @@ static snd_pcm_uframes_t lola_pcm_pointer(struct snd_pcm_substream *substream)
 void lola_pcm_update(struct lola *chip, struct lola_pcm *pcm, unsigned int bits)
 {
 	int i;
+	u8 num_streams = min_t(u8, pcm->num_streams, ARRAY_SIZE(pcm->streams));
 
-	for (i = 0; bits && i < pcm->num_streams; i++) {
+	for (i = 0; bits && i < num_streams; i++) {
 		if (bits & (1 << i)) {
 			struct lola_stream *str = &pcm->streams[i];
 			if (str->substream && str->running)
-- 
2.32.0

