Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F6838CDC5
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 20:50:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A136B16C5;
	Fri, 21 May 2021 20:50:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A136B16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621623053;
	bh=99BBQMLQVUwdD/x9aqTN48KjvCHpQ0F3iFkSb1YclUg=;
	h=Date:From:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hG0KC7qsrpHe5H+ZdYZAoWvg54QkUTq3TIbtQsVRAvgsV72QmTzmldu9tiU1osfI0
	 UnKxFPusx4aZNawoxJhMVnSgeytK5JPfkZvHnatmlbdx43xEkWVJZLd/I/OyR7JjMm
	 VbXS+gPYs4zN3UpoBuYjaCz9y6+EscCnGaubFXmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04878F80246;
	Fri, 21 May 2021 20:49:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2C59F801DB; Fri, 21 May 2021 20:49:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3772F80153
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 20:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3772F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qlPFXMex"
Received: by mail-qk1-x735.google.com with SMTP id i67so20782256qkc.4
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 11:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:message-id:mime-version;
 bh=iOqJxGZpWCOTLotNj0/1EnYMdTFe4+TuMESjaeykAHs=;
 b=qlPFXMexBYlXDkYAVclCFu+sqntjD8Uc+5rPfeelonlp4yyNJs++T5MtGL3DTMHC0f
 TF1gYRWc9TI0aanBYUKLzVEEEZXb4dFkQo4nDxKHOuH15n3/sw841bupFYPQbgcZrItG
 qVnYxV5NZdomCHrKprsZGlLdw7DUId8oyZxkaInV5MSazGTqgou4QpE7RdPcMjV5SdZd
 or0qafuzPRfoU/RRS8TPyhn9oc+J7xVkOKLk6QUWW3QFkC3KczNxoBhoazVF6dM/gpHh
 uR1nP339J1KQ8w862PQu2w+LxlgSDj1aib95n0T+KWYAfy76Lt5Likw5qm1THeQxycwZ
 Ih2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:message-id:mime-version;
 bh=iOqJxGZpWCOTLotNj0/1EnYMdTFe4+TuMESjaeykAHs=;
 b=FVNIK3cFkkpXhJ3p44yYwBQTRRecq2IchBH6VGtG3bxbCK9XzdTgYd3Tq0zMbK0HKT
 4qrGdEE5Vb1hUtWrpGEZjsa6tnfQ6gFpZWa15MTf3cwQlpqBF9gRXq/LbS3HIHPeM0Li
 Rsz6TGIxL8c0hnTyJ2jVgRWtY+N/6/FiH/+UgrG55eXyPwAXw+ButerpOYiqxxn9Y+yJ
 LsJDc2Hgz4nkiBHeoyNxGG7PYmflYqN7UYNBPmgfC6fpBVrlJm49pjp15P61s2u8PiYp
 koYCuhprWDHcv0nr9ZwfFbDVcA3LilqXTc5bncUBR9EbtrhEBrPywMX9POzH9WzswEoP
 2aSw==
X-Gm-Message-State: AOAM531r47myW/q4/guNVCdkoPn3adUOsvrc3P7VBjstwcwvjZp13pZC
 DsC1LgRRjn5PLBVZSxhPYyusqOWtYu8X8A==
X-Google-Smtp-Source: ABdhPJzfwhYH2JOejMNjNs5/bmexR1NJZcYRKf5f3msY8DpJsy/OWn5qPmIMVoJ9wToDzKg/KD0MlA==
X-Received: by 2002:a37:aa4c:: with SMTP id t73mr15006358qke.79.1621622954344; 
 Fri, 21 May 2021 11:49:14 -0700 (PDT)
Received: from ?IPv6:2804:14c:31:2618:a172:6c70:5a97:38d6?
 ([2804:14c:31:2618:a172:6c70:5a97:38d6])
 by smtp.gmail.com with ESMTPSA id m4sm5228764qtg.21.2021.05.21.11.49.12
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 11:49:13 -0700 (PDT)
Date: Fri, 21 May 2021 15:49:04 -0300
From: Georges Basile Stavracas Neto <georges.stavracas@gmail.com>
Subject: Motu M4 - where to report this issue?
To: alsa-devel@alsa-project.org
Message-Id: <S90HTQ.U7YWJKIETGYG2@gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Greetings ALSA community,

I recently acquired a Motu M4 interface, and seems to be working
well so far. Everyday usage is completely functional.

However, I noticed an odd sound artifact that happens from time
to time when using DAWs like Ardour and Waveform11. It's a windy,
ghostly sound that happens whenever I open any DAWs (the simple
act of opening them triggers this). Interestingly, audio apps that
use PulseAudio do not suffer from this issue. It's hard to describe
it, so I recorded a video reproducing this problem:

https://youtu.be/bM8x-YuXLVI

A few things I've discovered while trying to understand what's
going on:

* It only happens with apps that use JACK or ALSA APIs. Using
  PulseAudio (through PipeWire) does not trigger it.

* Seems like this sound is not an artifact of the interface; it
  appears that this odd sound is sent to the interface through
  USB. (You can see this in the video.)

* It's triggered per track; in the video, for example, the drums
  and keyboard tracks are affected independetly.

I was oriented in #alsa at Freenode that the output of 'alsa-info'
might be helpful, so here it is:

http://alsa-project.org/db/?f=62f686710cc6c9344a8986707bf3d09248c514d1

(I'm running this on top of a 5.12.5 kernel, which should include
this fix: https://bugzilla.kernel.org/show_bug.cgi?id=207023)

I'd like to know where should I report this bug (kernel bugzilla?),
and if there's any other information I can provide to help fixing
it.

With respect,
Georges


