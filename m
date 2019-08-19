Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCBE91CD1
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2019 08:03:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DEBE1678;
	Mon, 19 Aug 2019 08:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DEBE1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566194589;
	bh=c2aXZh1jVtp4ACAd95NHPgDuXYZ59f0vNcCa7DZPXQ4=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rjVapNKxxrTnz/RgIJfjD9nAi/5N5fQ6Aqqv5hakyIR1s4ltQBMTYBrhiKEpCmmf4
	 9tNVqIn7PiyPs7CrHVBUwDkyjz9MBKUeHABc/ZrvZ9N6vhjov7nV5JRr3L8rP07qjh
	 8lgVOGfZ75z3Q/RoRQ3IL7KLqjnVMHgd+kWy+6mU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67782F80306;
	Mon, 19 Aug 2019 08:01:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6331AF802E0; Mon, 19 Aug 2019 08:01:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62766F800AA
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 08:01:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62766F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Hg4tTT6U"
Received: by mail-lf1-x136.google.com with SMTP id a30so471124lfk.12
 for <alsa-devel@alsa-project.org>; Sun, 18 Aug 2019 23:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8P9txwNn/qSiRE7kR/xv384t7Cp93pqJVqU9wgtKGgg=;
 b=Hg4tTT6UrAM4gghL6wRiSJjN8J2ApuhEJFtAfc8Y/CK3OYU3DdE9S1fCYx0pBMPrRa
 DpgrdxC4Zw1WK7Xa9kCniksjy+FUVccqXXyJXQV9WAL7xaO19CWZJkZvJYgAT7qaROAd
 2d+ISyUugSdu+SeHSCEbHNLcDz93G/BrihTTrbigRiacn1zDfe9gKtag7UKu7nnOt1BW
 wM8EdVlNIuzciuPOI6uIueCeruhbcbNf5KmCni5QvXw8ONFzfSdXtkjOirFPATjoVVPz
 w7+oNV9cpJMTIskb/Z6mJfpL8DdSVvxpgRbQN7fZG0Wmi24IumcJMM5A+YRcymDDIilc
 XYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8P9txwNn/qSiRE7kR/xv384t7Cp93pqJVqU9wgtKGgg=;
 b=Xm1PblngbSppKn+VtXIU1FLLQXoIsN/c5vYkjGvkId3kg1mbb2/EPLkPuQbVX3RcF7
 o0wRnfsIE+GhQexAEpINxw487P3PdTNNhwGKlk6o8aFnVMf9pqBkWh9zw05pZ2Ipgnos
 S39b3BQq+0YglRr38Mma2/3p+Yj1BBBR752jVCzvxKylKvszx+2UULJBd9qwuNydjDjx
 EqjNxFedwrAoL8nKCmTAPb5PK8f/jMcEtu7aPXSsJmE7TxHv/8fFwtrMYu0DR0YzD8rt
 MmpB+4XFmEi2G8moV9iQKgVeJmJkYX4Npk2ZkV5Q6P3IwN50aT/UhJKqM3kwVAIA7zPT
 L2AQ==
X-Gm-Message-State: APjAAAXdEs2pV8C2JySp1oNsJqr+tJlujef95AQ0Eq1kLwHce/Vf6e/U
 EOM2Rb6ZWGJ+ieUvrHRKgcsr8itDQF222+Uoz0dTNA==
X-Google-Smtp-Source: APXvYqwa3/IE+OOnvnCZn/rA/0MtWXB22b7S8UDIvtmPZCF25SxNhaCX1SlItJq9P67Epw0h7CHLas36Q1EzI2Waifg=
X-Received: by 2002:a19:80c4:: with SMTP id
 b187mr10996152lfd.122.1566194478645; 
 Sun, 18 Aug 2019 23:01:18 -0700 (PDT)
MIME-Version: 1.0
From: "H. C. Dornelas" <hcdorn@gmail.com>
Date: Mon, 19 Aug 2019 06:01:11 +0000
Message-ID: <CAOFDp9PgOYQbx=YXxS3k8jX+jq0hTDus9JJwFh=SpezzCzzqwA@mail.gmail.com>
To: alsa-devel@alsa-project.org
Subject: [alsa-devel] es8316 multiple issues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi.
Using only ALSA on my Positivo 2 em 1 Q432A (motherboard CHT12CP, es8316 sound
card, kernel 5.2.9), speakers only work with headphones plugged in.
Using Pulseaudio, speakers work without headphones, but many other
problems remain:
no microphones work; speakers are muted every boot and anytime headphones are
unplugged, have no volume control and are only a mute/unmute switch; there are
more than 160 controls in alsamixer's bytcht-es8316 card, most having no effect
on sound output; and I still couldn't test hdmi audio. Here's the
alsa-info file:
http://alsa-project.org/db/?f=ee6dd9bdcf11a192fcccba9ab1b7abb2f3999b5d
UCM files might solve these issues, but I have no experience with those, so any
help would be dearly appreciated.
If any other info is needed, just tell me and I'll add it.
Thank you very much.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
