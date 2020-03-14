Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85383185B42
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Mar 2020 09:38:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A53A1857;
	Sun, 15 Mar 2020 09:37:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A53A1857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584261485;
	bh=WVZ60k6IfKM05AJAbdUB9cciX/3qiIYTHOOudU/C/DE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NqR/HPsAiHBSQ+AphS7maif5BgSBfeR3ewSl9VQ73GwI7Izf2hReXz03oWfSC44xA
	 YjXerGITpsxZrLKtQaEtPgONj8oVRSYjoM/eim/jPJE+p8v370UEatFcRueUELoh71
	 fsE72CJXC83fRrdT3xcMt/cSY0L4tAdc4hb0uDU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68052F802A8;
	Sun, 15 Mar 2020 09:33:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B61DBF8021C; Sat, 14 Mar 2020 17:54:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB47AF80086;
 Sat, 14 Mar 2020 17:54:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB47AF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Aly5Mc/Q"
Received: by mail-qk1-x72f.google.com with SMTP id d8so18522824qka.2;
 Sat, 14 Mar 2020 09:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WVZ60k6IfKM05AJAbdUB9cciX/3qiIYTHOOudU/C/DE=;
 b=Aly5Mc/QprKvizWrZMnr0buhkEYyM/5QaC/utbESHJ4Iv6nfLW/RzwwzfFGUADy8Bg
 68/7op/zcpAJvf5IIyPL9PCHoXpQNX0UhWf/58tXqICzFbXc6ONnrcYNxMCDoEBWGcU1
 QYQP838f3xwEZviYp1C4n4d4qOzPUA33wRghgcAPlkB3MPXibXdEPOGbknBATX5/TS2K
 XA+2EJjpQmCOLoe+3a34mA+dZqaxdkEQTHKbIDusTmwJIj7eLjmS5Q3oBEQbZV+Ryt9j
 uquYYWtzDSGFUrnpSwcy8/N2HrTgde7B4i1v4NMzpxwGPkwnreQqFhK7Snje3iooGGDv
 DRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WVZ60k6IfKM05AJAbdUB9cciX/3qiIYTHOOudU/C/DE=;
 b=kGs1cYqroBG+fbaantC34TJuAcrCi4ue1FZu9SiODdIni0vGkaOeN0RDuJwN8SxBXK
 iBC5IM0WmikJLMw6KvdsopFH6pTAgedf5AyrLzO5hnXs5lBu2PQxv451EO4CVkow6wQe
 zeLhP1c5ZpApy2v82XVZFonr2v7I/zPHcRCirp5s8qhkgajV3GIoFEkjOaoMXPCsegIB
 5EGvUbO7qhWGCGSj6BK4CY/ZtGuoE4m7OV6yey6qwfAgHw8UpyOFP5Z5vloS3WSRC72r
 LU0sGtMiUyWUUtPzRYvOhvddEMXrT8vmskXCmFbNRQEoXGYid04LEzYaGR13wHmx4w1Q
 x49Q==
X-Gm-Message-State: ANhLgQ1wmjA7G9xUwGUJExBA6VEOE7+r7+jIz1fFoOldRUFCGR23kkiL
 16NWMCstoDh+GZENfsUV+1Ui22IU
X-Google-Smtp-Source: ADFU+vvSz/o/y1lGBKcbZcaBQNflwwQQWO/tIFFAkgotkx6SBFN3ZPQIq4LpY1/f/88uPG98RAr1Fg==
X-Received: by 2002:a37:67c7:: with SMTP id
 b190mr17280684qkc.469.1584204855922; 
 Sat, 14 Mar 2020 09:54:15 -0700 (PDT)
Received: from cybertron.pseudoangel.com
 (cpe-172-101-252-194.rochester.res.rr.com. [172.101.252.194])
 by smtp.gmail.com with ESMTPSA id q24sm7969363qtk.45.2020.03.14.09.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2020 09:54:15 -0700 (PDT)
From: crwulff@gmail.com
To: patch@alsa-project.org
Subject: [PATCH Fix for Kingston HyperX Amp (0951:16d8) 0/2 (Try #2)]
Date: Sat, 14 Mar 2020 12:54:47 -0400
Message-Id: <20200314165449.4086-1-crwulff@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 15 Mar 2020 09:32:59 +0100
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Chris Wulff <crwulff@gmail.com>
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

From: Chris Wulff <crwulff@gmail.com>

This patch set is modified to use an inline function for the mixer control
interface lookup. The attempt at preventing modifications to a PCM that has
previously been registered has been changed to defer registration instead,
and has been split into a separate patch. This approach now works with pulseaudio.
