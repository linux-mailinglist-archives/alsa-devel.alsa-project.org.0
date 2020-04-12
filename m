Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AE81A609C
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Apr 2020 23:07:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E19A316CE;
	Sun, 12 Apr 2020 23:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E19A316CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586725625;
	bh=95sOgbZ4W7RrDUpmVQVqTM/gBD4HkuY69JbuDI0TMSU=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KS2AViUSeZmmBDSYK+Q4zAsy32CA/hLQe7Kp5uVAcfHWdSiKJVnr8Bjz2dxzzD2yw
	 wzshFAaExwp3krpj54DR6fxmoshlWHS8/8LWmJM3acOns5CwB6VXt9Uey4PnY42ujV
	 qMnj6HYa1SrnbPTrlTomuBM1FrTjbsDlnMVdgSD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C2DCF80126;
	Sun, 12 Apr 2020 23:05:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D97BCF8013D; Sun, 12 Apr 2020 23:05:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D294BF800B6
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 23:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D294BF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E/ahyzsM"
Received: by mail-wr1-x429.google.com with SMTP id k1so1165693wrx.4
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 14:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=DJLKShDtouEeuArxX9puy0QsvMxwbmxr66gQtxxuuU4=;
 b=E/ahyzsM12vwcaXx0yInX2wkM6ktzNfNjSFuvRf2npmkMFGWGyL1j4gduFCstup5YK
 QssoQZ+5ScGwNVnotp7t9bwVR6hDByH5F9YFeN1wFShowXZP2QJ2Yc3KWly7Zt1zWFE9
 Fe9uDsBVzRYv246NVPZvjMsL8kG/PVXxo6Mt3swN9BlBW4m3LlB/O1/g2S1WYyntvM1L
 I+zAQ6rcsAEH8HlfsJJsdh61B4Usodvwi4olcatpKXN9uFS6SIOiyJL23QvbDLO/HepP
 /vfXf+yBHc9f7cUsU+JaUN/5ZD9wym6sAD157WeRFyZgY4eu1D8ltu0bsmeo0/yKF5i7
 02sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=DJLKShDtouEeuArxX9puy0QsvMxwbmxr66gQtxxuuU4=;
 b=lZ1pCh7X7+JEIPlRExQMpsyS/IO3mfsAI/s7VUYCVKQ+010Um866DAFgnBxaI1EcjM
 LK2zE44debrBLTHVT85amnWc+a6mslU/XSt3KDhrItcqr7OCisz7JvVBRArV9coyK+sj
 6C1GrwD9d3JlN70zWqqYnXaKccF6dmRcvBmwmJR8ptP5yhgticR6whNDmdKrC8LXV352
 LhtQk9CR62UHCSyL0hwd4Vy+iMrifAa9l4n+mnZnL8r5g9PKuQk77iSVYJ4X+TQ8ur2i
 TSPiRY6jM86RkSR9yIWaoLZVe4Tnl75uSNG/Xxfnbj+3eH/+xZZ412en25Ku/lIeBEco
 ZSjg==
X-Gm-Message-State: AGi0Pub1gqfKR7u94XIifKj+C7eoCNjTF3TZD+bq8YqA3ZRzc5neVNW5
 L1YneTi85kUcbg7kEQ9kLxkPzlyb
X-Google-Smtp-Source: APiQypK1uaBUvad5bJFgEMTGU9fpVivXTw+xkLpd4n1okOUZYjRsdSQrg8n9pdrboOn/igFzHBvuZA==
X-Received: by 2002:adf:84c2:: with SMTP id 60mr15383999wrg.65.1586725514694; 
 Sun, 12 Apr 2020 14:05:14 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id l26sm4223857wrb.7.2020.04.12.14.05.14
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 14:05:14 -0700 (PDT)
Date: Sun, 12 Apr 2020 21:05:06 +0000
From: sylvain.bertrand@gmail.com
To: alsa-devel@alsa-project.org
Subject: [PATCH RFC] clumsy attempt at fixing rate plugin draining function
Message-ID: <20200412210506.GA32445@freedom>
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

Hi,

This is related to github issue #41.

I don't know how to update last_commit_ptr properly.
Neither if it is consistent with the rate state (boundary, app_ptr, etc).

-- 
Sylvain


--- a/src/pcm/pcm_rate.c
+++ b/src/pcm/pcm_rate.c
@@ -1051,6 +1051,7 @@ static int snd_pcm_rate_drain(snd_pcm_t *pcm)
 		/* commit the remaining fraction (if any) */
 		snd_pcm_uframes_t size, ofs, saved_avail_min;
 		snd_pcm_sw_params_t sw_params;
+		int commit_err;
 
 		__snd_pcm_lock(pcm);
 		/* temporarily set avail_min to one */
@@ -1064,7 +1065,7 @@ static int snd_pcm_rate_drain(snd_pcm_t *pcm)
 		while (size > 0) {
 			snd_pcm_uframes_t psize, spsize;
 			int err;
-
+			
 			err = __snd_pcm_wait_in_lock(rate->gen.slave, -1);
 			if (err < 0)
 				break;
@@ -1077,14 +1078,29 @@ static int snd_pcm_rate_drain(snd_pcm_t *pcm)
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
