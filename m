Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAB0AFFC4
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 17:18:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BA7116EC;
	Wed, 11 Sep 2019 17:17:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BA7116EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568215127;
	bh=9iFQQbq4Q0CxkTn0JA9IU21b3mbyKlr7n7Sh5l+TGqE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L53nxNAU/gVxo7p6qnvz2G91vKSZkzRm6NU6yT6/Ud1dAvdROwvTiwMsUuRwRnnl5
	 lZ8kPh3UQWdQXN8/+I1hhIZ6ICcBsLoDgo8kyEp5TzIjsqT9c2xAC9bDKoNYSbyFUb
	 YLtmBYppM1oK3Esdv62JdFqsZ+N0wAhgWev0x2Vc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EF0DF805F6;
	Wed, 11 Sep 2019 17:16:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D848F80368; Sun,  8 Sep 2019 23:02:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66B2EF80157
 for <alsa-devel@alsa-project.org>; Sun,  8 Sep 2019 23:01:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66B2EF80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GE3Uo+P5"
Received: by mail-lj1-x22c.google.com with SMTP id a4so10717532ljk.8
 for <alsa-devel@alsa-project.org>; Sun, 08 Sep 2019 14:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sVmsqyOJ1bzihht7PQeFIY6VoseQx0d+/FjGbTudk+c=;
 b=GE3Uo+P59LxW6D8oZ7Y/3O/adt6p3QSx8BeeYU8WjrwP7Zjk+IBuy69i3TqwaWrxXq
 gYWVw78xEwTqsG/gz1adGDsXMi+8JyE5HSzlkzCVWVIjZsIx03v1hlHMc31omPBn70St
 xc/ez40ePCgnqEl4RsPh+F+aIkbkwu/eX8FDN6Je95+bBcbUispGmbOurw4WHeJaitAk
 vfMj4SamvtKFqOWTSri1y44p1rj17Nd5sF1cce9rPbS97ALpEwgAaGjHD41DqVa+kTiU
 lrpKbPhzpzY1M/nSUExrmR3LbC4ntBsvavd6rFVE5mYtn2qKWTgF4lJSeVOWdcd9lQUV
 Q10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sVmsqyOJ1bzihht7PQeFIY6VoseQx0d+/FjGbTudk+c=;
 b=foumfQe6vhRoXwIW+0lhMTmL9Pu2M+DaSMQhOw/l3C43T9lOZbvecab+wTExVM2VeY
 Mdixkxrfs35k61JU1I+UvHOkXB/zW/mKUu9MWOZVzEqy4VWg8/8f5vB1PKzzhl66+t9b
 z3+nDoonFlHRk1Ydqkdx3ab3PaofPj1FuXq8doXSKtbzMxNvb5dMjMumz+Rof0GsVYlQ
 qBCWLiAFLiBvNPIi1R9HI7lvxROG1IMjqPHCGdj+X8L6W+KahQdRy7znzK0pGvT7zi/c
 m4CcWAvjhpieM9R3Sd8+89EYbUSIDfUYzR9pIFwfuiA9DK/XKQjA8OW3dKfAhWD/Inq8
 eanQ==
X-Gm-Message-State: APjAAAVoPP2GeRIGid/LNOXiARXwD1H7nlX3rYRHkAJYfM6YLfssV0YO
 nzIAlspOIqn8r9rV2i4x+40V91danqpadiSxhgs=
X-Google-Smtp-Source: APXvYqzcv+MohFsebeWATlYedyT7W7aWFJMgjJX9WyDvgk79ciUCFdufsN8drsbm4wTWmuRwS6ZJ5n3KurxBOwZVqDE=
X-Received: by 2002:a05:651c:1035:: with SMTP id
 w21mr3572991ljm.119.1567976519185; 
 Sun, 08 Sep 2019 14:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <15679391594432724-alsa-devel@perex.cz>
In-Reply-To: <15679391594432724-alsa-devel@perex.cz>
From: Misha Komarovskiy <zombah@gmail.com>
Date: Sun, 8 Sep 2019 21:01:23 +0000
Message-ID: <CANLc0-YjPP_5s_QZDcg2K4e4JHcyQ1jbx=QovV3cTWpp5Z-R+g@mail.gmail.com>
To: Jaroslav Kysela <jkysela@redhat.com>
X-Mailman-Approved-At: Wed, 11 Sep 2019 17:16:14 +0200
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Licence change for your alsa-lib UCM commit
	(zombah: 1 total)
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

Hello Jaroslav,

On Sun, Sep 8, 2019 at 10:39 AM Jaroslav Kysela <jkysela@redhat.com> wrote:
>
> As discussed, we would like to move the UCM configuration files from the
> alsa-lib repository to new alsa-ucm-conf repository with the licence change
> from LGPL-2.1 to BSD-3-Clause.
>
> I would like to check, if you agree with this licence change. Please, answer
> to this e-mail and write your agreement / disagreement (keep CC to
> the alsa-devel mailing list for the archiving purposes).

I agree with licence change.
Thank you.

>
> Thank you for your time and co-operation.
>
> Reference:  https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/153257.html
>
> List of your commit(s):
>
>   24b4e86ddc512acb6b26f97cb958d59586482fb7
>     conf/ucm: PAZ00: add Toshiba AC100/Dynabook AZ new config
>
> ---
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.



-- 
Best Regards,
Misha Komarovskiy
zombahatgmaildotcom
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
