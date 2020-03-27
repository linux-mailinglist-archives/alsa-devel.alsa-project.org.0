Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED057195C70
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 18:20:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A18186F;
	Fri, 27 Mar 2020 18:19:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A18186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585329639;
	bh=dmkyA8pY6y/v1664D9aoiYBvLi5TiltVrZ2SzmdJWR4=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NZMgAihRzPPApwPbkUr/aKu8DlxXIiECn786HQqCp+dr3ulNpsTtjVi3p4VGU8Fz+
	 uzOVEx5uyPteRK5GPvb22bfxxRgnxWj2Nte1R5tulY6xQHnSpGPJ1Gu9ZUkq5858Du
	 ZATNNNkopiy3FB7Ja5/9gsYNhDXNChdDNKLxcMy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 863D4F801DA;
	Fri, 27 Mar 2020 18:18:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 598F5F8015A; Fri, 27 Mar 2020 18:18:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B19B5F80147
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 18:18:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B19B5F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YdmJIKva"
Received: by mail-wr1-x432.google.com with SMTP id p10so12335073wrt.6
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 10:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=PSUyp9mh9zzGz7WtxUBFm4ZhdtcGHPkm37YZwxddco8=;
 b=YdmJIKvaFttPZCgBStmjXigcYMLHLGydZgGjsfWl09JxK9iJnGUWujFNtQOcFbpMLw
 R1V5nRDk5O9Qrhrs6RL/DzRD6Dk9iZDnEq9SWUz65T96vGxDKT0KMvasEYpy7zmzvjzn
 M4GiwKC+ezrMBx8DnKlveJ/9Bd6ZRFy9D9I2moSyHQ1vh4CohZSFRjoARISqRW9mMfcL
 8DZ7dTTB8HHGd5SLyy4G1ghBWbwDx8RwQu/dwojPmKNrRMyiNmFd8mSIBja/tHIxZcxS
 o1vsPmCYnZZpQHVoy9sl6M66K84gM1XWP7nLsodSlxiVra7+G4+pZV33WjmYUjGTh6kD
 4tRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=PSUyp9mh9zzGz7WtxUBFm4ZhdtcGHPkm37YZwxddco8=;
 b=SWz14lC0jrQkZyV4UqglKlF3+jmVF/2x6UWrRifxZwJmqxUiWqVIsM2QOI3DhEO/yC
 7Kyr2ylR0UWmXMoyc+2iiMNAnGrGTt6fud/NnicLM6UosCWjAwd9FxKcmaoZ3K9daQ+N
 xcJWxhcmMPFYFjWOc1ZUiPA0hMZYaCBEE/J2XOx0vTG/rwLVqrpeonP3Evk7QeyvRxcD
 HGyOzc6axh6tL0cdGjujDfITSCqNp4/jyejOtuFbgVIo85oskBOdinopzkgdt0uhJSDc
 A9im9AATJT8lMqVcY3bVNXjgoHwS0ForRVf2+PftQj3CUCYTZOHRJjufy0AXBLwKBKGN
 c/5g==
X-Gm-Message-State: ANhLgQ1Mg1kth3jF7mIPWVvY5fvgJrp1tEJ8U/0ttJUYt05ZtcXBdme2
 2pX5xUCiZqHtStAu/T4+uGmz1H5X
X-Google-Smtp-Source: ADFU+vvx/nvtBIZVYwqNcZbhasecQmKXetHlL9QGaDHq9cmzdYR3QwxxxGd3xe1Kfp9xmzV64QznJg==
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr441630wrk.101.1585329527592; 
 Fri, 27 Mar 2020 10:18:47 -0700 (PDT)
Received: from localhost (108.78.124.78.rev.sfr.net. [78.124.78.108])
 by smtp.gmail.com with ESMTPSA id u13sm9178496wru.88.2020.03.27.10.18.47
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 10:18:47 -0700 (PDT)
Date: Fri, 27 Mar 2020 17:18:24 +0000
From: sylvain.bertrand@gmail.com
To: alsa-devel@alsa-project.org
Subject: [PATCH] additional cleanup for "arecord -L show entries which are
 not capture pcms"
Message-ID: <20200327171824.GA18675@freedom>
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

I did post to github, my bad.

On Fri, Mar 27, 2020 at 04:01:57AM -0700, Jaroslav Kysela wrote:
> Closed #39 via d434638a683c01bd6decf8f41863044055237a50.

Tested with the mic from my usb webcam, and it actually needs a little bit more
tidying.

-- 
Sylvain

--- a/share/alsa/pcm/front.conf
+++ b/share/alsa/pcm/front.conf
@@ -53,6 +53,7 @@
 			name defaults.namehint.basic
 		}
 		description "Front speakers"
-		device $DEV
+		device_output $DEV
+		omit_noargs true
 	}
 }

--- a/share/alsa/pcm/iec958.conf
+++ b/share/alsa/pcm/iec958.conf
@@ -78,6 +78,6 @@
 			name defaults.namehint.basic
 		}
 		description "IEC958 (S/PDIF) Digital Audio Output"
-		device $DEV
+		device_output $DEV
 	}
 }
