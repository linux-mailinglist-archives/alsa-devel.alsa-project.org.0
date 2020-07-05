Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE14215061
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 01:33:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3816E16B3;
	Mon,  6 Jul 2020 01:32:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3816E16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593992000;
	bh=gQmg+aViyd2eG4cg4uTdrGamN+wErKHFsIndgpKkrqY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FjqnNRlNV0n72YK0JeHm2osuU9HXkembMZtbrmRFHaWcA0FKMLshOeYGBe2IyySpx
	 FgS9T9fgy7CT88SwtNK5hPaCHJAiEG3Uj1S7fi9uNO8LV/YlMS0lUwo5KPkSHHM7tA
	 ildYqipZGVRSrpUpbm1nvrSRFUKKOCh9+OXp9avs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C193F800DA;
	Mon,  6 Jul 2020 01:31:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F13D8F80216; Mon,  6 Jul 2020 01:31:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBCAEF800DA
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 01:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBCAEF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PPgwtr4v"
Received: by mail-pl1-x643.google.com with SMTP id o1so8041712plk.1
 for <alsa-devel@alsa-project.org>; Sun, 05 Jul 2020 16:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Kau7zMY1dJtPnAeFjFb1bpRpxzhyG/k07bIDDi1B9Sw=;
 b=PPgwtr4vUclIXDDzRAzx5UNpfygKAAnwFGo8N6m019/7vON7mJvo2wH1tyFl8qwOtV
 KHIG72FyJXp+vEln8Jv+6+QDrjx6mpyRANzqfRjeiFJjJLP67GS0Ri3TBSmJhUpyQkBs
 o31T6l2WnekkjvWdXD22/yS29c9nuKKBzZ/L/RfmqD7zPsPk1BbHnUM73cikcLoFBzE3
 R19e/XplnWi2I27+AM4A5D7XgwpXJsTg4zpbPuWYfOhyIw7KNSyuRmuxkYRkebGB1rnq
 RhGDwE7cRVFsc2H10tf/cgFFyK06+ACzKobIsXuqWmjPduu8wkmo168oGaP5kReeZyTy
 UYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Kau7zMY1dJtPnAeFjFb1bpRpxzhyG/k07bIDDi1B9Sw=;
 b=WI5iva/Nh29Q6T+3N7PQJttyMNdOGIuXHbqgyStM0HyGrpqL4qes3OiwWA0dB8lAS+
 BerILImbUIl9UXCKwRR3lksBPasX6GcubZe1u8J1VBeULR325wPdtVRGCy3DTxFfMTWE
 nAHnOtsrTY0usIxm6yviJdE8M5ey/W2YWJrPMR7u+luxSr6l4pHDI9aQQ4HzvoDR+KrD
 4wlcGwI5JtvPYY/lWCAC7Y/QI54YqcZx2ce52rdbOWEWTs/bPq/RSi/R1Xr0VXXHF7d6
 j9NQsRWcXxWnZ13EkGCPwPMPiwbABax3oncbkQzJ1XPZUVfE+P6Fbv/2DeQKXyHaajqD
 zCgg==
X-Gm-Message-State: AOAM530tycgLkSr7JGOZyZHpVUn4ClYqA+y++MA877MbViaDADCHHsKR
 snuvH2PwaKbNkLxyPU5aId/GZ3NsMEg=
X-Google-Smtp-Source: ABdhPJwy+14Q5gXEnZviYclyR6O6yWEYat7xQeoEtaSlw1qYCbD9Ewn8pytUK08Lmb2Gznh3U6KIOQ==
X-Received: by 2002:a17:902:d68d:: with SMTP id
 v13mr40357626ply.10.1593991884792; 
 Sun, 05 Jul 2020 16:31:24 -0700 (PDT)
Received: from f3 (ae055068.dynamic.ppp.asahi-net.or.jp. [14.3.55.68])
 by smtp.gmail.com with ESMTPSA id r191sm453948pfr.181.2020.07.05.16.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 16:31:24 -0700 (PDT)
Date: Mon, 6 Jul 2020 08:31:19 +0900
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [External] Re: [PATCH v2 2/2] ALSA: hda/realtek - Replace Lenovo
 Thinkpad X1 Carbon 7th quirk
Message-ID: <20200705233119.GB2439@f3>
References: <20200703080005.8942-1-benjamin.poirier@gmail.com>
 <20200703080005.8942-3-benjamin.poirier@gmail.com>
 <58a7791c-0db4-a585-c550-3d3e9576191c@perex.cz>
 <SG2PR03MB3324D74B5A539F69DBDDE0F5BD6A0@SG2PR03MB3324.apcprd03.prod.outlook.com>
 <a09194c3-3f2e-823c-e455-b7c5e7d73e28@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a09194c3-3f2e-823c-e455-b7c5e7d73e28@perex.cz>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Hui Wang <hui.wang@canonical.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Vincent Bernat <vincent@bernat.ch>, Even Brenden <evenbrenden@gmail.com>,
 Mark Pearson <mpearson@lenovo.com>
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

On 2020-07-03 14:43 +0200, Jaroslav Kysela wrote:
> Dne 03. 07. 20 v 12:59 Mark Pearson napsal(a):
> > 
> > > -----Original Message-----
> > > From: Alsa-devel <alsa-devel-bounces@alsa-project.org> On Behalf Of
> > > Jaroslav Kysela
> > > Sent: Friday, July 3, 2020 6:34 AM
> > > 
> > > Dne 03. 07. 20 v 10:00 Benjamin Poirier napsal(a):
> > > > As a result of commit d2cd795c4ece ("ALSA: hda - fixup for the bass
> > > > speaker on Lenovo Carbon X1 7th gen"), the sound output level on my machine, an
> > > > X1 Carbon 7th gen, was reduced to ~65% of its previous level when playing
> > > > certain sounds. [1]
> > > > 
> > <snip>
> > > 
> > > Thank you for this work. Perhaps, Takashi will have some comments to
> > > improve this quirk.
> > Seconded - thank you!
> > 
> > <snip>
> > > 
> > > > It is possible that the X1 Carbon 8th gen would benefit from the same
> > > > changes but I don't have a device to test that. Fixups are reordered so
> > > > that the devices for 7th & 8th gen can share the same chain after the first
> > > > fixup. The resulting chain is:
> > > 
> > > 8th gen hardware should be similar, so the new fixup should be applied to this
> > > hw, too.
> > > 
> > We'll do some testing here and confirm the fixes on the X1C7 and X1C8 (and Yoga)
> > 
> > Do let me know if there is any details Lenovo can provide that would help
> 
> The functionality of this patch is same like the hda-verb command is
> executed with the current kernel (run as root):
> 
> hda-verb /dev/snd/hwC0D0 0x17 SET_CONNECT_SEL 1
> 
> You can control tweeters with 'Speaker' volume control.
> And headphones and bass speakers with the 'Headphone' volume control.

For other X1 users who might stumble upon this discussion; practical
usage of the hda-verb trick requires a way to apply it automatically[1]
and changes to the ucm profile[2].

[1] https://gist.github.com/hamidzr/dd81e429dc86f4327ded7a2030e7d7d9#gistcomment-3345062
[2] https://gist.github.com/hamidzr/dd81e429dc86f4327ded7a2030e7d7d9#gistcomment-3335517

I've added more information here:
https://github.com/gobenji/thinkpad-x1-gen7-sound/tree/c5ebc9166e955934dab03d6c4fb5928cf28496b0#alternative-2---runtime-reconfiguration
