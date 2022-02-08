Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EB84AD3CD
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 09:43:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E66D1719;
	Tue,  8 Feb 2022 09:43:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E66D1719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644309833;
	bh=gcEykSM7P4hJhRifcHDp5haxj5D6r/IRqCQR2BbGoK0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ft31as60MyPV8gY431kuuZoD26SVoD4dEdHGUxdVMA42u45X404c12qqLMMoBlC47
	 YdLWamiv4PCgIjfOjJL8EK/6WaxqywskZGDnExbBcZbjIHQaCBpsQoOH/UjCnL+oSH
	 d+X3AqNt5+rH6SGAwAn4j2Znkx5pMU0Xfts7mnNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 810CEF8015B;
	Tue,  8 Feb 2022 09:42:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB8E0F800E1; Tue,  8 Feb 2022 09:42:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 200B5F800EB
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 09:42:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 200B5F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cogentembedded-com.20210112.gappssmtp.com
 header.i=@cogentembedded-com.20210112.gappssmtp.com header.b="xMglItI5"
Received: by mail-lj1-x22a.google.com with SMTP id k18so11358009lji.12
 for <alsa-devel@alsa-project.org>; Tue, 08 Feb 2022 00:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7sXih+ccMxcBT8wCEbMO89tjHCwmk+TU2IW/0GU1YNk=;
 b=xMglItI55LyHwpmXQT9i4/capUmQ/SyZQhS2ZQe4/yss+9baUfxpl12RZOkkUW6UV/
 4HSga1o/zvckGlgofr3fjrpXMQzELQlpiDrNiO157uRtYaqpkvxNvu+8zX3bJhuGMzLq
 vFSNYE2of3XjzCoL3ZpxzFL0hFce6VPr3kEiiaTHsNCgUWhm4c0I3u6pDnia8W1c4ZA+
 8qPIsrEBjf3XsuA5pKW1Ccau2ovabd/q8H0ihEE+xIhJoZxpEn5MfbnyUbcReEc5PgzL
 83/QZrF9Xqs+warW5FjW5t+KggMqEV8WeckAUhliMW1GxxA0hmPHwRypkxtJMaL06uA8
 fE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7sXih+ccMxcBT8wCEbMO89tjHCwmk+TU2IW/0GU1YNk=;
 b=bz52AgZrnWrkM15zlpwYTzyt/zMTGt3k8B7oe88ff9ueFxVu49jJRXdhOFjstnOb59
 GFevCD0x8ySljUrmmPyIEabqjmfBjbZZL+3x6NM6fyXj+KzGnvcmdJ8TjUanP2h6lB5x
 WVYvQZaWJC39euUQV0Nfy08GNFbH5qLIBSTU5fx+2aVFWbK1FhLuthv0zZU7yNPaszUF
 iS/ES53eBYR7uJK+mGUJHQBKtJ3bsEJ2uQr64Q7LgZpdfhNeBJr/kQoCZPBNNLSkLA1x
 JZn015Unq8JkoJsWEkoPz1ORo07Wl12d9snph01cyfjqvPEkqRbelvGai6lV5w627xID
 H50g==
X-Gm-Message-State: AOAM5311KjvQ1v1j5bzQ3okajYqOVwWmPe72Kob/1j3s+2lE7YyqgNL9
 p3NA/3OqPEr3oIHj9bME/HqSdA==
X-Google-Smtp-Source: ABdhPJxj3u6KYnR1Lph70mDUde0CqcWPX+n/2AA8smx6d6xJkBjAYWrLPu6pDbFJHGQjQ5BzunD3dg==
X-Received: by 2002:a2e:95da:: with SMTP id y26mr2206876ljh.203.1644309760597; 
 Tue, 08 Feb 2022 00:42:40 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id o12sm1830361lfu.96.2022.02.08.00.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 00:42:40 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/4] ASoC: pcm3168a: code cleanup
Date: Tue,  8 Feb 2022 11:42:16 +0300
Message-Id: <20220208084220.1289836-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

These patches clean up pcm3168a driver, without introducing any
functional change.

Nikita Yushchenko (4):
  ASoC: pcm3168a: cleanup unintuitive mask usage
  ASoC: pcm3168a: refactor hw_params routine
  ASoC: pcm3168a: refactor format handling
  ASoC: pcm3168a: remove numeric PCM3168A_NUM_SUPPLIES

 sound/soc/codecs/pcm3168a.c | 150 +++++++++++++++++-------------------
 1 file changed, 70 insertions(+), 80 deletions(-)

-- 
2.30.2

