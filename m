Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 128E7BDEF3
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2019 15:27:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87B8D170A;
	Wed, 25 Sep 2019 15:26:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87B8D170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569418060;
	bh=7dTJFjiGmUiTg9bmGxEpkPLxlIxXeByPyyn9VDjMAsc=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lggzi1PRNQmKx82nbXLiQU5oxR9R3Qc7yMHqWsiLS6+Cm8PC/u/AH+BNZvN6r2Lfs
	 ZnJm4cPl1R02xck2CvQlycJ1mckLiD4qvKdTl8JGc7GsCxoTS6lWUKjaYtNpULIdae
	 /uYpY38nvT9N7V9PbGWvCbnIUYu3MKaO/u7I3xrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20F5EF802BD;
	Wed, 25 Sep 2019 15:25:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8702FF8044C; Wed, 25 Sep 2019 15:25:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50041F802BD
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 15:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50041F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tGEHjKoS"
Received: by mail-wm1-x335.google.com with SMTP id 3so4966021wmi.3
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=U5LbEhvdDcYAgldwxf5AE0NTYVKCqDWsYOrZ5rG3o9Y=;
 b=tGEHjKoSaBedvQ4ihgLytRPwNwwX3kPzLQTn7dZsJT5LngsbQQkLlIq1/4USp76D6w
 YnpFS282TnkpnKgin323JjioTVEPzB2YGhv5GrjzmgcYeMsiFVl8Lb/R1I7GtcshAAXf
 cEaGiA+ILdcwNkFBDfCpp7V7iZI4fn0ykqpCHQncOGfamcyvmQlxaAVBBNNIxkhHRYC4
 bHKqhZL2j1wcAXgceheSLR1bvYN5V5S61CFOOLSQbXcA/Ore80qZdXA4AFgftxpxvyCT
 PBvMI81nRXT+26kAmEst87tLa4wMs6dU64twTjA7vtAqejqX86zOML4FbTEHGQZLc4Px
 aWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=U5LbEhvdDcYAgldwxf5AE0NTYVKCqDWsYOrZ5rG3o9Y=;
 b=M3zGvoHcki4M58XEuw8kYIMHjJxFR46MeB3I+9CfjwK7RG1FKweshi+/Gw+ozpRA5v
 yJaMpl5BLBwZhiXqoS8dYfU4ELfmNCo8TvLu8j6FSyL1OndNJh2ll+fd/8ydg52m7y4D
 WbgRf3Xm6YKptoKawr2vW8EqVidMvxlfdXnBI1wO52FTYukJilHat2pnom98A7YN0ia0
 4sn1N3RuJVnrQuMgVtSibprQgHFNU9JNqhbl09alv5x0zQQWJBiDydMzrRr0EeqZ6AFr
 d9zZLlm3WLSN+Rho28er43ermukVP76YO5HVwnJxns6OFz/AjtBjx4d1uG3TRhgmNhV7
 +Gyg==
X-Gm-Message-State: APjAAAUwcFAv+OA+T2pNathFD0ul/HISJRBh/5Do/42VKahvAGvwdvAP
 sqwtR4FGnHa/maAJRL7vg6ZDtN67wK6h9V7Fw3RCxowNvXcmcg==
X-Google-Smtp-Source: APXvYqwRXiQbBDbVqr1dKbzREGmLhhjKV75aL+JbBmDHLwG5GEejG3s5JxZeM/RycfXY4uu9fu9LCfCJcI5UwCk7nsY=
X-Received: by 2002:a7b:cd08:: with SMTP id f8mr2335595wmj.87.1569417940863;
 Wed, 25 Sep 2019 06:25:40 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 25 Sep 2019 16:25:28 +0300
Message-ID: <CAEnQRZD6VsaKbjP1FaBMk5iT2jkk=baPUixVyWMNoqqRXM9hhw@mail.gmail.com>
To: Linux-ALSA <alsa-devel@alsa-project.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>
Subject: [alsa-devel] About soc_check_tplg_fes
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

Hi all,

In function soc_check_tplg_fes (sound/soc/soc-core.c)
there is this code:

    for_each_card_prelinks(card, i, dai_link) {

        /* ignore this FE */
        if (dai_link->dynamic) {
            dai_link->ignore = true;
            continue;
        }
        dev_info(card->dev, "info: override FE DAI link %s\n",
            card->dai_link[i].name);

So, we ignore any FE DAI link but then the info message says the contrary.

Any idea?

thanks,
Daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
