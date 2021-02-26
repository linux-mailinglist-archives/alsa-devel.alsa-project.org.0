Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E11E3269A3
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 22:38:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0131216A2;
	Fri, 26 Feb 2021 22:37:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0131216A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614375505;
	bh=9G+8NDd9JKzebeiOlPctME7I/OfjrixvB0Rd30nYmUk=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AWxDPjYzAU/ZiI7ecoxorQJgb8c9+/50/QU4ZfuqHBFqN2dPEcFpcQGyo6ZfeNjGF
	 XwSd06YAMNiLlbPyg/ll6F727cSKEPluTBmK4NYtxfSILc8TWCKw+vi+gQljqYe962
	 SJ3enDcvxMU9eaFRK5zSpi/C0jylZw9nJ+9JdNWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AF64F8022B;
	Fri, 26 Feb 2021 22:36:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F4BEF8016C; Fri, 26 Feb 2021 22:36:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2781F80154
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 22:36:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2781F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=george-graphics-co-uk.20150623.gappssmtp.com
 header.i=@george-graphics-co-uk.20150623.gappssmtp.com header.b="o6ymOXMI"
Received: by mail-pf1-x434.google.com with SMTP id t29so7113856pfg.11
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 13:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=george-graphics-co-uk.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=cRLodfWRnEjlTZrSBt6hDfYE5X58rZ2ErBl6zq1bcAc=;
 b=o6ymOXMItFTeRh+rc7ebXZfFwq8cwp52/KXjmElVgQZD/qUwcEc/LaffX4mnC6WgVn
 i0OnGDWEPfxaKuiRyc1E8daAbjQ0sJN8OTj4uLNpVYzBPICJjC6xpm3HMJHOqx3RTO43
 0zROfxsBbpjFT3Sr+rw+RK7TtdJ6Q3942lxxaBnaCWRYokcRwNsEwlwaqZUUyI8GUQsm
 jy0k5FagAlCRg04PFuwH50DEJXlv/mihnOnGLJ46tB6znP6MTOF3u5rSYa6kXPi9RfHi
 Pp7YQQ8bv7ydcU1Q0qwA1tn0cOJih3ARRxaZnfSXu5UMhvKoRdIOo/AshOxGD0HF3qvy
 avBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=cRLodfWRnEjlTZrSBt6hDfYE5X58rZ2ErBl6zq1bcAc=;
 b=KsEbhgqCIkVIvRDx9TFFSHw8qGQu+61cJTO2akpH1na8iavMGrvNuU4XJM1lYkoKlJ
 Tk4ntg8HqR7gMJ1i7CrFbRKPh5oh167Eqn7BoKHNMQyvDVIabh21TiGg9i+xygmDBGpK
 p8xSHVxc/d5nV1AxdUsl+UAzjqmvBHPd4Uj9QqVwSdZnsxkNL9ucpFe20Dz6bBinWsC6
 z3KxZxnAxn1G9BaOEwAGaore2/cVcAbItA8t3x0g6ctqRjFjws4W63HBYMyCl9b9Qw/Y
 EYBTTerpzUenFJTFPFSqTr5KQK1UNu+Fh0EF2trmXpidnMlOTyqNglfvyv1pcWeTR55T
 zQGw==
X-Gm-Message-State: AOAM5338mlQLEsYmk4STm5h0BGCJWz5kt4J6RsZVehF+WosjcJvOBidh
 /6dpikhSd49iGXHDgcAbS6pF8w==
X-Google-Smtp-Source: ABdhPJwxjF858MeTFv5S0/K4kufLD8+kXIoJgCdektiYqdnA+pdyvVPCJhl6odd99bScgjDs6D5XsA==
X-Received: by 2002:a62:b516:0:b029:1ea:34a:a70e with SMTP id
 y22-20020a62b5160000b02901ea034aa70emr5117459pfe.38.1614375404008; 
 Fri, 26 Feb 2021 13:36:44 -0800 (PST)
Received: from ?IPv6:2601:602:8000:181:d8ec:3c42:2c25:f1d1?
 ([2601:602:8000:181:d8ec:3c42:2c25:f1d1])
 by smtp.gmail.com with ESMTPSA id 25sm10685597pfh.199.2021.02.26.13.36.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Feb 2021 13:36:43 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH 2/2] midi streaming substream names from jack names A
 number of devices have named substreams which are hard to remember / decypher
 from <device> MIDI n names.  Eg. Korg puts a pass through on one substream
 and iConnectivity devices name the connections.
From: George Harker <george@george-graphics.co.uk>
In-Reply-To: <20210226212617.24616-1-george@george-graphics.co.uk>
Date: Fri, 26 Feb 2021 13:36:42 -0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <FE234989-046F-4E65-A574-25C79A8726D2@george-graphics.co.uk>
References: <s5hczwpucd3.wl-tiwai@suse.de>
 <20210226212617.24616-1-george@george-graphics.co.uk>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>
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

Thanks for the feedback, addressed in the two patches.  I=E2=80=99m not =
sure why it pulled the body up into the title.I=E2=80=99m sorry about =
that.  I can resubmit if that needs fixing.

George
