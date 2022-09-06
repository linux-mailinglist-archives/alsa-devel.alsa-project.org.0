Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 793D75AFC04
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 07:54:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BA6374C;
	Wed,  7 Sep 2022 07:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BA6374C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662530042;
	bh=oN5ga2fuB3IK+HFNfiC/4X6kfL1/chvVI9SkGpjxy9s=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uYz/0rlKiyAu8wJgvDRJyQRxU5ofPz/FUa8hez/SmqVl4NBXA30Fxq4a/nCjqSteI
	 RYcU2H6qqUmuGZA/9BjNEHWDXjIk0kDRqwEUjkQi1blZLPQkf+l03CuhYHVYF3bdjU
	 JGqP9xN8sPFt4xz21sunVwvHnzuFcC0h0kSsDXDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 077A0F80423;
	Wed,  7 Sep 2022 07:53:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23DE6F80249; Tue,  6 Sep 2022 15:28:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED14AF80165
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 15:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED14AF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eRE94Nix"
Received: by mail-vs1-xe2b.google.com with SMTP id 190so11650870vsz.7
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 06:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=gzCA9WFEtgYjs0HVgXVw4o7QIWuhc+LJTZt3XCy7BUo=;
 b=eRE94Nixgcz2K4wETcCkz3cDfD5QPLCSxVCkE/6rtSt9ZkhZxJSpixx12o6gPQyVUc
 j53otkvqyGg6hcRdKvP94MaEVPLzzvoqh9+ipa+HJxhEO27vYNy4gTp1s/9SF8azlayp
 l/jWD9/iaKqi3QtglStmga+KmhVfG1TT/74vcuPxEbSBBQK0hL++NymgN2Vidv1SM2Ls
 0qgmYpeNzCZLyUSdoZPsjT3EmIk2J1XdeuqHqm9RpBMJCBTrTXIUMZkeofs2rgqTx/K+
 tyRqkdB0SgIyH1otp61PWdzul8gflOVm3O7VMdW6YU1igm1lu0jsG8iqQKJC4rtsTyKv
 x5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=gzCA9WFEtgYjs0HVgXVw4o7QIWuhc+LJTZt3XCy7BUo=;
 b=uY3dwketWpek+Awj1fIY+F7D67+NCgI4GU2e3FMe7gob00zoBDUAW746o/LPpc2JCE
 jzVY9e4P2GRjgLLFOMxX7mXqWypNsdDTIDV/gEcCxxfZmfK2Q2m9LtMjb1YhFu7i+UWR
 CVaXnn4PasMiG5U8DfaKruAQK8CAkBQEk1XrNYeEYWDyZItUpSumsBp+v1IP1I9G8Gc+
 UDg5M+cf3eumneEoK2XRLI0GYPSWAv4fWIlU0v9YyeWxxOzyqICbJG6NYOXUgrDjhg1f
 +bELPnsQtHkmCaO7IgtFCvCD4CEFkwPulFr9eS1yhtB7jtzMzsuy9qMopICS6eN9l38X
 mUDw==
X-Gm-Message-State: ACgBeo0H5UuwOT1unNx7EsZaJPhuA3WqCA2eyhqNwJwxReHm/4sno1Z5
 kru1BnNodyP/O1Bbvuz0OyNltoBslhEdXxMhn7WemimM
X-Google-Smtp-Source: AA6agR4g9Zm51/l4mYTqhxYCWKXPhhJFswYVXnsAdZfZYBtq48iDjOzvX2g3nORF+Ejf7dh9jw0W1Ntp9VJhtcRjOXo=
X-Received: by 2002:a67:b042:0:b0:388:c9d5:8af with SMTP id
 q2-20020a67b042000000b00388c9d508afmr14574392vsh.40.1662470900898; Tue, 06
 Sep 2022 06:28:20 -0700 (PDT)
MIME-Version: 1.0
From: Web X <webx93@gmail.com>
Date: Tue, 6 Sep 2022 18:58:09 +0530
Message-ID: <CADP81_VWcrTmQgDRxLwDjMNR9A11q8BTCvZ1bRmPqxcrSkLf9w@mail.gmail.com>
Subject: Query for snd_pcm_readi function.
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Wed, 07 Sep 2022 07:53:00 +0200
Content-Type: text/plain; charset="UTF-8"
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

Hi,

I am using alsa open source library for my project to read and write audio
data.

For that I am using snd_pcm_readi function to read audio data. I am able to
read audio data.

But issue is that sometimes it will take so much time to read data.(200-230
msec).
Normally this function executed in 1-3 ms that is normal case, but after
every 2-4 frames it is taking 200-300 msec.
So this is affecting my whole application process.

I have also try to set this call as nonblock with the help of
snd_pcm_nonblock function. With that I have observed some improvements but
still after 2-3 frames it is taking 100msec time to get a data.

Please do needful as soon as possible.

Let me know if you want more details.
