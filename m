Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8655FFDDB
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 09:29:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5EDC6F81;
	Sun, 16 Oct 2022 09:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5EDC6F81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665905380;
	bh=9+1swGEePlzzPLuFMDDUTvETtv9LWuYLo7KJFFRzpQg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YnvLvahU0UyZ6Fg991nfB+/oXyPrbmrx4FMaFSn6FtTRgaoPMebAuD3y8w5xRM6cJ
	 4Dlt2CdNyrY54LnNJ+dTLnELPFYzzOI3exAXk3KOeq1k1JPQAE+KES38Egh709Ov3C
	 qJNDeE/at/lllc2ZhGakGaWw5CBca8/jvTVvkiJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34071F8027C;
	Sun, 16 Oct 2022 09:28:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA5A6F801F7; Sun, 16 Oct 2022 01:34:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B3FAF8016A
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 01:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B3FAF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HeSYkYVF"
Received: by mail-ot1-x334.google.com with SMTP id
 a14-20020a9d470e000000b00661b66a5393so3880568otf.11
 for <alsa-devel@alsa-project.org>; Sat, 15 Oct 2022 16:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a+jzEUqbWtBeB9kCbXWG0XvcCyj0LENJYNoMRZHZ2sQ=;
 b=HeSYkYVFz5toVpabXxQDB+DAKyZfVC2VSAvN/xbuohc/iQJepvNJcH6kAYXhHIErI6
 4RuCrCLOmaxQRMQiCXu6IUlIvnflyIzsZFXwnmjzTpUtRKc+JJcsEv98moo2Yy0ZiHBI
 OpamfUTOHwdfqhhk5Hz/Xhnjzfyhh3omDkWRscKjOfymKT5l8KMN+GnVpXjL7Y9+qmu2
 xa8ZiawTMWffwQdUsz3niyISnEIE/lEElLV1NdS/0maRlIGeSYJQfKe+2f7VGnIaoHq7
 NKRYg3De8/xilI3SpC5s4Mc64qPXICsAvMFvZ8maFh2hWkqSZEpqvZpCyrceVWi10Da8
 9QZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a+jzEUqbWtBeB9kCbXWG0XvcCyj0LENJYNoMRZHZ2sQ=;
 b=eFyumLns5iWsDiT8TI0WjYWp1yE4YzEcwShggy9Ky7CE2QLu5k6R1EIyhGRgm+1ZWk
 XRUysncdMnmh1VgYU3tAwjJQW9IgoTqEoUTqKXxjqrEmHjDpglE5u4m2qBwCc68XeLzP
 QbMRfdq8aGlOidargllhLt4TPpZ1gDbuLIIWBMnBthbq2LKQRs+Gc/8r4pPDJUmVU9sZ
 OKTkqB9X9Lg2Zt51ik/Ix/NHs3M1IVGg24Zgv5Yj6oxMFjSM6K6SKr0HTaCSuwXtwKD0
 Ck7150D5GTMYLHDeAevIftyac+wZammV87MFEUWDDqJnx4Nl9Glyr6nmLtV5hLGdLOX7
 I7qg==
X-Gm-Message-State: ACrzQf1AQaGUVKsbenjWbp96U3IFSfV3SBoSeJLVYydwB9TeXUXPyWlJ
 1tDhdHs8QwJP6Ynd4qU9k4g=
X-Google-Smtp-Source: AMsMyM7GjyMRI5yohg0orqz5B3sv9bc0OjNgA2CyKOAqR7JhaUTQ+/f+xio/mOyi7OAXaT7UZMbo+Q==
X-Received: by 2002:a9d:4915:0:b0:661:cf09:1752 with SMTP id
 e21-20020a9d4915000000b00661cf091752mr2048084otf.346.1665876850286; 
 Sat, 15 Oct 2022 16:34:10 -0700 (PDT)
Received: from bebop.lan
 (2603-8080-2704-6601-b457-170a-9e05-cc6d.res6.spectrum.com.
 [2603:8080:2704:6601:b457:170a:9e05:cc6d])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a4adec3000000b004808e0d8467sm2653858oou.2.2022.10.15.16.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 16:34:09 -0700 (PDT)
From: George Hilliard <thirtythreeforty@gmail.com>
To: Clemens Ladisch <clemens@ladisch.de>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH 0/2] sound: dice: Firestudio Mobile
Date: Sat, 15 Oct 2022 18:33:28 -0500
Message-Id: <20221015233330.8679-1-thirtythreeforty@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 16 Oct 2022 09:28:42 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

This short series adds a configuration block for the Firestudio Mobile I
just acquired.  Very similar to the Firestudio, but a lower port count.

My understanding is that the Low, Medium, and High speeds refer to
48kHz, 96kHz, and 192kHz sample rates, of which only the first two are
supported by this hardware line.  Please correct me if this is not
correct.

Thanks!


