Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2901B498551
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 17:54:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3C1F28BF;
	Mon, 24 Jan 2022 17:53:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3C1F28BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643043280;
	bh=Ry98Z/eudJ1uhdc+mVU8gPfVclHa8GqXw2nsi+tVPmk=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m/TAFPNE5ih/5iUpoiBHAs5lOi7dnWuOs4YHSqxRYhHx7365C8C1+19klMDSEus5C
	 dT73BAnk40E58klfIIXGawbnRUwRBcDPxudneqI1f1YxN+OpmKPdqVV8WS3XzS1voU
	 8HdygADPnCFXmhglHB+3iuZDxRbhw5TCU7U14NRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AEE8F8032B;
	Mon, 24 Jan 2022 17:53:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5713F80310; Mon, 24 Jan 2022 17:53:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36511F8027C
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 17:52:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36511F8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LpGgp5k7"
Received: by mail-vk1-xa2c.google.com with SMTP id w206so10572185vkd.10
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 08:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=PXwksbm6On2bKZujxHp1uizlEiefM1/I/7i1KQgmjy8=;
 b=LpGgp5k7T+XJOEgU0QyZLCazil75SZfWnFTgPswY9s0Ko/kU+qdlpWOGo5q0+kEqTs
 MptzlyUzyxafla/KTAgUUdQovo8h9oEPdioL4sxcB1ZrvBAO8leneN7K5PdnsgsGGyX2
 VTefJAR5aHgudldPFJ9/DTyZ4DmfEAG48iLg8llMHtaVcb7XFjDacYmfgRejk1ZMrgXP
 NukLuZwK6J6uyduMfoB9cVZq4w/78M/xt+r6XnekOUGx6ZUqrvW1KznaqyieUx6DiYLv
 Q/NkEjGetMsruscZvuE1XDMCP4LrgkfPZIXpKdBbhe/Gy/w4Z0vZyK+H6zWvThYjHkGA
 1GQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PXwksbm6On2bKZujxHp1uizlEiefM1/I/7i1KQgmjy8=;
 b=jf7FCCpat2brb5H0XHWHJzPAaHgu3n5htf3xaSdeushM0EUcncE9NHuTRnj8TKWFe4
 9ghTySA7aAx4NlSpgAPEezdFHsny4GukDiDTw6w3j7H+v8Kwj8gzMwMGtHioSJXfk3HU
 pcxxnpuDUV7XOkjX0nM49pTRKMRnRgH3NktU5bjvYaF93uwVshKmgvxXAS8bbtnEaNkj
 RZFGoYeVF59nmRTAX85vpdDbA619Mj5ygidhQ+Fpl8kim78ifV3Ed5ADjxkOKsmofJbG
 U+y069bUl+HQzaRR1Wmk3IRzztgyUfyB5l6FqrTB65cqu4a0a/ayu8RMTy8Mj7ffXsx9
 Sn7A==
X-Gm-Message-State: AOAM53276NEeAnbipp9xnzh8Sra8ELpmtL00njHjEUfgXpWV2Z2eJmJ5
 P+rMz1+3FX7jzwYE+eEkqIBG6Y/EDZyN6Duci4+9QvFtcbQ=
X-Google-Smtp-Source: ABdhPJzacw15J00rnJJqLOCtghaG6fCYUKbKWS3da4KPbNBL3LcFC9U6xV2V+YNMbOW9vf0qy82fXNpxEdXprYz+rZA=
X-Received: by 2002:ac5:c643:: with SMTP id j3mr3363818vkl.14.1643043177736;
 Mon, 24 Jan 2022 08:52:57 -0800 (PST)
MIME-Version: 1.0
From: anthony tonitch <d.tonitch@gmail.com>
Date: Mon, 24 Jan 2022 16:52:47 +0000
Message-ID: <CAAEBy7fQ6x95H5XkaKmXWsB1KCDbYAFtA5zUZ03ToJSegHb05w@mail.gmail.com>
Subject: No sound on gpd pocket 3
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
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

Hello,

I have a problem I guess related to sof... I already asked on the irc
#alsa@libera.chat and gnarface advised me to come and ask on this
mailing list!

I am struggling to make the sound of my gpd pocket 3 to work on linux
(archlinux to be precise)! In fact, the sound is not supposed to work
out of the box as other users tested it before me! but they all had
the solution to set the dsp_driver and this didn't worked for me!
I checked several times to see if the module was loaded properly and
yes it is (as you can also check in the alsa-info at the end of the mail)!

If I do aplay -l I get a bunch of hdmi connection that is not working
at all! I'm really lost here and I don't even know what to look for
anymore

The sound works great on windows so This doens't seems to be hardware problem ?!
and I tried to plug an usb headset which give me sound so I doesn't
seems to be config related either ?! (tho the jack doesn't work)

I asked on several places already. I post the different links here in
case you want to check but I don't have any response to any post
unfortunately!

- Post on Archlinux BBS: https://bbs.archlinux.org/viewtopic.php?id=273044
- Post on subreddit GPDPocket:
https://www.reddit.com/r/GPDPocket/comments/s31qi8/gpd_p3_no_sound_linux/

- Screenshot and bios picture of maybe relevant informations:
    - https://imgur.com/a/DouSB3m
    - https://imgur.com/a/K232PLJ

I hope there is enough informations to help me debug this but if you
need anything I can provide it! this is a small pc and I'm usualy
quarrying it around!
I know this is better to send mail but if you need me to chat for any
reason (it would be easier for instance) I'm usually hanging on the
libera.chat irc as tonitch you can pm or tag me on #alsa

Here is the alsa-info.sh :
http://alsa-project.org/db/?f=6ddb669a19086cebdb121c97c25bbdccb98e856d

Thanks a lot for your help!

PS: Ubuntu mate have released their official pocket 3 distribution and
I tried it but the sound didn't worked either, here is the alsa-info
In case this help ?! :
http://alsa-project.org/db/?f=df4c183fd00cec224006ec8caa228705399ad873
