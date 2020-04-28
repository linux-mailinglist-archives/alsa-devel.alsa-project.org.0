Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BEA1BBD27
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 14:11:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BBF7168E;
	Tue, 28 Apr 2020 14:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BBF7168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588075870;
	bh=vRCFeQRMB2kDXqxE6pFIKGmuO+n0FlyEp0mQsscstPo=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W63JzBLTGaTn0jaFPZdOEbEOKV3E9J4cfnl05NL2bbSev3P34/zrYQCykvdu+L3+Z
	 nxLOznVVbrifjg3r/rrDzoPne6e9m9adEvwGAej5NkqcqIT5Er56EmzquPm1vYocVy
	 3CAKId1eUVOG9yj8BivXxUHrGwzsTXq4yg5L5XOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9EC0F800B8;
	Tue, 28 Apr 2020 14:09:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1EC0F801DB; Tue, 28 Apr 2020 14:09:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B8ABF800B8
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 14:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B8ABF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="P2/U5JJE"
Received: by mail-wm1-x343.google.com with SMTP id v8so2216004wma.0
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 05:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=wgWj8BoJXv74+3Yf2H736Z9Z1857na1U2iISg5vEznk=;
 b=P2/U5JJE5oxWC1fsSKSPHzX52Vxx+BMLYm718xsRCGK3cCOdukE3hyIinLrhZVwbaP
 AhVsJIdhxOvJm3uATidob975Hke+Q7b2NO1j+W+rbmept4+80frOanp+V2OusHQujgcP
 tMWrZjv7drIRefcq6BvjJcKfVYNoFjp19WHGgg4+mD9U7OUuptUjDsV9K0FzhTb42g6m
 Rg+fT4pyPoNFXHNzaPNkUePYNnibFgHnaMApQmrITM6JXSJCA7aumPzuKVkS1BAr7ZP+
 YyB5qG48Fn+b2vDjAYG8kc8ov9SfcBPjZhEdjhRoW5AEjagb6HpfO+UpvfaS/LI8sstB
 4EQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=wgWj8BoJXv74+3Yf2H736Z9Z1857na1U2iISg5vEznk=;
 b=gpKqUo+9RMS4hNqW2TAXDlIZi8QAKO7J4ULBz5OXVfD9YM4Xf5xmhkHY+ymsar+mwr
 bDmoFG+UzeWGqE9mGdnQWQ6gXV/9CJyfbopMJZVSkfvI+ElusPExOzpb+uRvrA6P3ZMh
 GD60h9SR0Mrj+5i5F7Q0jUvTX6xzEsqyLTGcV3E6Yz+3nBYiuXR/zld/u47Qd6B/orOj
 eRWu28XHKauwADo/ChMJFL80tOHuo9/Dd6SpAtVYd08R61XkMr+bXoW8Fq4CivlRHDrT
 hvbuROCRCQkbKScc5/XJaKwB837abFvQRgKKHgSjWi0mW8qrDDt7emGxpAZi3G4naj2B
 hNfw==
X-Gm-Message-State: AGi0Pua9DkPq12wde3GgbCLixKAaP5n/GeC6QvNPq+Bwcu5jCSiek2/Z
 P5D4HQ5O50V+PJ/1lENB/5JM05lD
X-Google-Smtp-Source: APiQypIA1RgpVNhg8hARyfORs0JETiJ0/wX9bAgW81WvDCv465J4JRw1rvDwlmXq7jjs2vGoiNt7Hw==
X-Received: by 2002:a1c:7c07:: with SMTP id x7mr4233491wmc.63.1588075761667;
 Tue, 28 Apr 2020 05:09:21 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id y10sm2978262wma.5.2020.04.28.05.09.20
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 05:09:21 -0700 (PDT)
Date: Tue, 28 Apr 2020 12:09:18 +0000
From: sylvain.bertrand@gmail.com
To: alsa-devel@alsa-project.org
Subject: [PATCH] fix infinite draining of the rate plugin in SND_PCM_NONBLOCK
 mode
Message-ID: <20200428120918.GA459@freedom>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/ (2018-04-13)
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

The draining function of the rate plugin does not handle properly the
SND_PCM_NONBLOCK case. It can write data to the slave plugin each time the
function is called, but does not update its internal state in order to
reach a stopping condition. Use a last_commit_ptr workaround to reach such
condition.

signed-off-by: Sylvain BERTRAND <sylvain.bertrand@legeek.net>
---
 src/pcm/pcm_rate.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)
---
diff --git a/src/pcm/pcm_rate.c b/src/pcm/pcm_rate.c
index 21611f62..25574a50 100644
--- a/src/pcm/pcm_rate.c
+++ b/src/pcm/pcm_rate.c
@@ -1051,6 +1051,7 @@ static int snd_pcm_rate_drain(snd_pcm_t *pcm)
 		/* commit the remaining fraction (if any) */
 		snd_pcm_uframes_t size, ofs, saved_avail_min;
 		snd_pcm_sw_params_t sw_params;
+		int commit_err;
 
 		__snd_pcm_lock(pcm);
 		/* temporarily set avail_min to one */
@@ -1066,7 +1067,7 @@ static int snd_pcm_rate_drain(snd_pcm_t *pcm)
 		while (size > 0) {
 			snd_pcm_uframes_t psize, spsize;
 			int err;
-
+			
 			err = __snd_pcm_wait_in_lock(rate->gen.slave, -1);
 			if (err < 0)
 				break;
@@ -1079,14 +1080,29 @@ static int snd_pcm_rate_drain(snd_pcm_t *pcm)
 				if (! spsize)
 					break;
 			}
-			snd_pcm_rate_commit_area(pcm, rate, ofs,
+			commit_err = snd_pcm_rate_commit_area(pcm, rate, ofs,
 						 psize, spsize);
+			if (commit_err == 1) {
+				rate->last_commit_ptr += psize;
+				if (rate->last_commit_ptr >= pcm->boundary)
+					rate->last_commit_ptr = 0;
+			} else if (commit_err == 0) {
+				if (pcm->mode & SND_PCM_NONBLOCK != 0) {
+					commit_err = -EAGAIN;
+					break;
+				}
+				continue;
+			} else
+				break;
+
 			ofs = (ofs + psize) % pcm->buffer_size;
 			size -= psize;
 		}
 		sw_params.avail_min = saved_avail_min;
 		snd_pcm_sw_params(rate->gen.slave, &sw_params);
 		__snd_pcm_unlock(pcm);
+		if (commit_err < 0)
+			return commit_err;
 	}
 	return snd_pcm_drain(rate->gen.slave);
 }
