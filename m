Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A146917D532
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Mar 2020 18:19:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 308CD1672;
	Sun,  8 Mar 2020 18:19:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 308CD1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583687996;
	bh=9mmOa8ltPWehoaksnl0v1oD8tW4ErbBOUrkQ8K7MR5s=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kaJNRire1MtNcm62CbHf8hOYDIBZqqUj36+lqbHN0+ilwBjzgGnZ9EJ1x2+5urJH6
	 RlbskT1/ZjyCDHOD9fM/J6Y/fcOLA7bhN9VAXF/odfy1qObMlMsKAnTVulX4DVCPri
	 nB8d9lvU+eqzRaJzlxKV2jrKyANnorqDAgQtjF1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0BEAF80217;
	Sun,  8 Mar 2020 18:18:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62CBCF80123; Sun,  8 Mar 2020 18:18:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47075F80123
 for <alsa-devel@alsa-project.org>; Sun,  8 Mar 2020 18:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47075F80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mGbhwKOp"
Received: by mail-wr1-x441.google.com with SMTP id r15so3123508wrx.6
 for <alsa-devel@alsa-project.org>; Sun, 08 Mar 2020 10:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=HGInJXKdVnfWJS68yXyIkQZArITn0CaK6RLEWgM+jr0=;
 b=mGbhwKOp2Z4114yS+oKJvi6Le7JNzJKUivm2+FFBc/i6+tlsusXL0vtk5zioTfH2Ik
 Jyrw4tejQcAmrAMn3+hHGMmygg/Xo/VgXj2mMUEDNfPQ/BusFRVx3iJzZjlPG1KTd0hA
 wnUPU+lRRfbVJG1E6hF7PB71ryOTQeo0n5ARKaDHmzqfPK3uNmYGcB+BcU2QrSyso6m7
 Jh+kIknMf/ENDXyX9Qy6mHIJQq7/2NuEiB8sakKhoE5QNITBi56KElaGGzbYmhFjoIHS
 GMYLhDmL3Z6NJX1UJCr6kwF/LvLJP+TQNYa0/j9S8nV43gnjOSTkbW+X2r6vi9hlNwiY
 X4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=HGInJXKdVnfWJS68yXyIkQZArITn0CaK6RLEWgM+jr0=;
 b=VWd8q1VUNAHyOqnE1rGCoLgViyNEwsaGLYanowhzPe4LR7jKphqGziJXltGvc5F4GY
 2C5gTtv7MJCfWMNxgebzhramP9mdrS80LVD9WXM+dsyzmXgIVHt7mg1ZzqruzZZdgWVx
 7kg9eooi8e7lAPM7bN+Uv2y6XbKDlZYOHdy3dtP1uIBLZTl71y6+Xu45Np/ncA7qzT0Q
 jjLyeDy3s5lli3Phir04duaO8VfSwH2mVtEqqL3M/R/dOre39gyZ3PCkj18lCB71WzJH
 JpxeTKJOOuv6AZ+hOyS/f5/Js47h7Zw3RdGuc1BJmdZfu5Excqb0sHXo6xvaX29f+tZ/
 aTUw==
X-Gm-Message-State: ANhLgQ0+QQdkfiody1x18D511+iYqhlOHq097kQImay1xfTXyr2UJomf
 Kne55yXTnQx0k2Wl/2bLsn6ejhQV
X-Google-Smtp-Source: ADFU+vsYOAyBgMlQU6NB+bQEgIRzT5u1lAVCEqE5ETyOSVAddm5eB2yQETcU+hVpFNtb9P7ELM+13A==
X-Received: by 2002:a5d:4707:: with SMTP id y7mr16983749wrq.213.1583687886460; 
 Sun, 08 Mar 2020 10:18:06 -0700 (PDT)
Received: from [10.10.10.102] (adijon-656-1-26-152.w90-13.abo.wanadoo.fr.
 [90.13.161.152])
 by smtp.gmail.com with ESMTPSA id t14sm26527867wrp.63.2020.03.08.10.18.05
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 08 Mar 2020 10:18:05 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: Olivier SCHMITT <sc.olivier@gmail.com>
Subject: increase soundcard max number upper than 32, kernel ok, but alsa-lib
 and alsa-utils no.
Message-ID: <28ea2dbb-e77e-2ec5-7546-299b81efceab@gmail.com>
Date: Sun, 8 Mar 2020 18:18:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: fr
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hello dear Alsa dev team members,

I try to increase alsa max number of cards in default 32 to 256 for use 
more than 32 loopback sound card for signal processing.

I have compile my kernel and also déclare in 
/etc/modprobe.d/alsa-base.conf more than id max value in default 31 i 
get a 32 it seam to work:

ls /proc/asound/
card10  card12  card14  card16  card18  card20  card22  card24 card26  
card28  card30 *card32 *devices  lp1   lp11  lp13 lp15  lp17  lp19  lp20 
*lp22 *lp4  lp6  lp8  modules  pcm timers
card11  card13  card15  card17  card19  card21  card23  card25 card27  
card29  card31  cards   lp0      lp10  lp12  lp14  lp16 lp18  lp2   
lp21  lp3   lp5  lp7  lp9  oss      seq  version

I have compile alsa-libs and alsa utils as:

sudo mkdir /usr/src/alsa
cd /usr/src/alsa

git clone git://git.alsa-project.org/alsa-lib.git alsa-lib
cd /usr/src/alsa/alsa-lib
./gitcompile --with-max-cards=256
make install

git clone git://git.alsa-project.org/alsa-utils.git alsa-utils
cd /usr/src/alsa/alsa-utils
./gitcompile --with-max-cards=256
make install

but when i try to use aplay or speakertest with -D hw:32,0 i get:
ALSA lib pcm_hw.c:1713:(_snd_pcm_hw_open) Invalid value for card
Erreur d'ouverture à la lecture: -22,Invalid argument

Maybe i have forgot something?

Thanks in advance for reply :-)

