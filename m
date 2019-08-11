Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAD98AFE5
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 08:26:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66F071616;
	Tue, 13 Aug 2019 08:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66F071616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565677604;
	bh=AwUUc4qV3sE290Lxf8uvCr6Eqfe6+ARSRBuzKkbSRHY=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i4kBDx5tgQlObpvRV5ZvGo+SceBKnuVzdwq9hiJdU5UtcIytf7ifJJ8o89Z/gjbIi
	 JQTdbWuiLtXd4YA8hgqiCMHAC9yK6oF6Nu/43UJCOfWUNvCl+sdSeAv9eHmwnaxbRy
	 95m77cSJA/0k1dK4zC2tw7om8NtCxtB2IVrl+6ec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E1ABF804CA;
	Tue, 13 Aug 2019 08:24:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D6D0F80273; Sun, 11 Aug 2019 20:15:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21034F8015B
 for <alsa-devel@alsa-project.org>; Sun, 11 Aug 2019 20:15:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21034F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="b8fpqwGX"
Received: by mail-lf1-x133.google.com with SMTP id 62so67935847lfa.8
 for <alsa-devel@alsa-project.org>; Sun, 11 Aug 2019 11:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=TmYX9vYe7tLCZY9CBjS6xYWuhLwwqCeX7LsKXpfhwLM=;
 b=b8fpqwGXXZOEwiVvAq/3yw3dqScUYDBdqsZF49Xu0gDokycs80W99DTGSNffOc5a/b
 mNp2q5yagOIdJCXCkEUF8odLg8rFKdr3ni/WVel2cyFzMmDmZFfHeg/9DxExsNhPwF8z
 vyIu9OVzWShl8jol7WNHmJaJanG8oISyQtaUyh30lbru7uXDBvVPUL0aqU8PFcOagR7j
 vwJccdD3ZTOKG4INh98mIvGUl9mTCz1jIEDEc0gDhBjJdEgad3PS04r+z8kjxik51jvO
 OiWVfwHtY19JJL23Idyqy/A1Yn2vSumDPc1r0wfl4OzOJCkZTmINojTKv8+yWOjXAjGV
 SY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=TmYX9vYe7tLCZY9CBjS6xYWuhLwwqCeX7LsKXpfhwLM=;
 b=jCwUTG2ID3ujHrIV6SqwOyueQ7WNNqYj55pwI6NPy/Ae3ol9Il+Xjh+gbH5zEH8iJZ
 TkAOiz4JGjO+AAqop5t5Xe2EPzoyGWvVQl88FH1okCNTr2qKir4JdM6Z4RcENhx208wp
 4IoUGtkVyKgNj98abRhSmNZnU3OHHBbJZCqglpWySYUVS/PCl6Zo+KAncUENnRaG0Jw6
 qRWt30L7HUaetYBMuTER7sMbDb+YKIr/lE+C5zYBu5cC3dGbwNnzYT5v9UsvgdZaCEgd
 4mxArXo1iUa52aU9tQYzauMSEsa5YK06yn6KYiSa+od/+RrVnjXh1kN22J2amCREjcsl
 wYhg==
X-Gm-Message-State: APjAAAU8Iaqg6rruC8w21T8aGuJFB/FrL7oAKgx/wkpqdhg/noplFQC3
 olSbJNcwAcAvU1nl3E0HHkVlXTCqpXn8AbBp2glCVLDx
X-Google-Smtp-Source: APXvYqz0T1iTccBE71SL3nUYH3sptu6YhCb/UYZ/ekg41XJljPsGGaTh1dzcxDD0sTSu9POsb/MfNVURIlGVWL8/Nf8=
X-Received: by 2002:a19:80c4:: with SMTP id
 b187mr17387512lfd.122.1565547323607; 
 Sun, 11 Aug 2019 11:15:23 -0700 (PDT)
MIME-Version: 1.0
From: Eric Desjardins <desjare@gmail.com>
Date: Sun, 11 Aug 2019 14:15:12 -0400
Message-ID: <CADsNRHu__S2EU0BNqrUs=OZzx_B2-rnt3DrmrtbLE3twDH=L7g@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Tue, 13 Aug 2019 08:24:11 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] snd_pcm_start question
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

Hi,

This is a simple question. I call:
snd_pcm_prepare
snd_pcm_writei

and it works fine but I would like to delay playback start. There is
snd_pcm_start for that. There is a method that is deprecated to specify a
start mode but I was wondering what was the correct new way to do that?

Thanks,
Eric
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
