Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9344D2D41CC
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 13:12:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 308E216B4;
	Wed,  9 Dec 2020 13:11:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 308E216B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607515923;
	bh=mKmKB+6DSPExkQJa+VONskJhYPYY9cNcHLsGmx6BeY8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MWpYxK/HezgRZUGBBPfPsPV4Rn/ENoDoKGSMvOXg9nf0R+byexULIvB3XNYF5lbIi
	 1fKC28dY091OasFtsgOXhJPynH2GY4djU6+7l3JQgUvPzzeK3JTVz5VXkQSEvypdcW
	 nAwkoFF4PpIZtScWwItwQJsxH5/iYV3FEtf8khwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52207F80217;
	Wed,  9 Dec 2020 13:10:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24E83F8020D; Wed,  9 Dec 2020 13:10:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2718F8012C
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 13:10:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2718F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de
 header.b="hTvFqgVF"
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 391152400FE
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 13:10:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1607515818; bh=mKmKB+6DSPExkQJa+VONskJhYPYY9cNcHLsGmx6BeY8=;
 h=Date:From:To:Cc:Subject:From;
 b=hTvFqgVFXHrBxBopcLw7BDCuHdeG4bNyJaBKsV5HkxtkIo23N4wYXbJjnRtUT7Fay
 1xPATWJiCtIqvL9qzifC9DdbkAKCRGHagXOBOdcaVMAHKs9N890oJn4aDyPwuXgRSC
 qIE7wvny1SBwD5anvYzIIzG4BOM7ZuHl+m11+JZuymJAanYXdbluyWsOgI8bvKn11C
 8dUHQ+3G5vhudio10qp+r6zYFV1OOOIIg24tt7WI+hliYo/poxbIXDo+oyL+noOIuC
 9KuICcsOmyqHgGj+azS7K8HgQBYESCKDQAK6/ZSQGHkd3YGvxRogRmER5OFXhOgfKn
 HBajfHIvHcWVA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4CrbTj68Ltz6tmK;
 Wed,  9 Dec 2020 13:10:17 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 09 Dec 2020 13:10:17 +0100
From: meschi@posteo.de
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Steinberg UR22 Crackling and Clicks
In-Reply-To: <s5heejztcjc.wl-tiwai@suse.de>
References: <ce03244f4699ffc9574ecc2dae41a417@posteo.de>
 <s5hft4gy4ar.wl-tiwai@suse.de> <61da73624ff3855867b8e65936fc2e1c@posteo.de>
 <s5hft4gwdji.wl-tiwai@suse.de> <eb1baf202fa4cd74a502661bb0ce5279@posteo.de>
 <s5ho8j4ujwx.wl-tiwai@suse.de> <987d1956f52ba49dc3b587c33e08bfb2@posteo.de>
 <s5heek0ugtk.wl-tiwai@suse.de> <4188489e2967b44e57653193cab9d1cb@posteo.de>
 <s5ha6unv52k.wl-tiwai@suse.de> <5811c5724e831c38395d3e5b57439b4d@posteo.de>
 <s5heejztcjc.wl-tiwai@suse.de>
Message-ID: <e516dc005a88536dba67e958c5611180@posteo.de>
X-Sender: meschi@posteo.de
User-Agent: Posteo Webmail
Cc: alsa-devel@alsa-project.org
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

> Then try to pass implicit_fb=1 option to snd-usb-audio module.
> It's a new option that was added recently.
> 
> 
> Takashi

Nice, that did the trick. there was a small glitch on first playback but 
I can not reproduce it now. Playback seems glitch-free now. I will test 
it with pulseaudio in the gui if I can. It's not quite easy to test, 
because the system locks up after a while with the new kernel and gnome 
3. I will also test concurrent playback and recording, too. Thank you 
very much, that was a huge help!

Kilian
