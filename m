Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB2A4F353C
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 15:49:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CB5917EB;
	Tue,  5 Apr 2022 15:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CB5917EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649166566;
	bh=L940+BjtIFTE/F2hK7zJ5314fCg6+o2jSl+cZo4AB4U=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RKXxSSxHqFxfkc+EuuvZbIZimrCclwVBwIYpqzSt45he5JXfZWAvS6H96u9oCkVFE
	 xJZiKA+ln8pJnFBZF8SGvYj3IpIx153LOdfq7Yb5jaayZPHX/4WV2y085miYx0mhKk
	 oQwg8t7x8KnFlXw0TloJgk143eVba5Bg863B0dGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC36CF8012C;
	Tue,  5 Apr 2022 15:48:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92BC0F8016A; Tue,  5 Apr 2022 15:48:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E04CF8012C
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 15:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E04CF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FNuQeoqh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8785614FB;
 Tue,  5 Apr 2022 13:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AD0C385AA;
 Tue,  5 Apr 2022 13:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649166502;
 bh=L940+BjtIFTE/F2hK7zJ5314fCg6+o2jSl+cZo4AB4U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FNuQeoqhWp7RKDV5m0kQMwRKrARsSVoOgz0olHveaHVLxFYUjdbVZffcnzjXejyQr
 mf8FSBreaRxwnvRMY/OY7wmmp6BJ015NqBl5ORDOnL+N96VODQ6srMUkpNeTGmAFA9
 2krQIhtoV8wwCwd7kPPkIjaPLFa/2ev4jyw+X9Pu5zPIJuggg1Ftz5LxOECCuLRiP4
 Pe3qUEbcDVpZokm30yH44Y41SZ4mzmfDq4KKvY7qbx0G6hdaA9GY8nV4BcwwXJbZIZ
 GHPSDkA4aq3ZYrg1yfyffUmvOjylqxRct/CybycerRgkggSilFau1F0xcPrQrWheav
 KQZ5zaK5yoWeg==
Date: Tue, 5 Apr 2022 15:48:16 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 0/2] Make headphone work on Huawei Matebook D15
Message-ID: <20220405154816.5cfdc49c@coco.lan>
In-Reply-To: <168fe6c3-6a7d-4019-16e3-066caf394b8a@redhat.com>
References: <cover.1649147890.git.mchehab@kernel.org>
 <168fe6c3-6a7d-4019-16e3-066caf394b8a@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 =?UTF-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-kernel@vger.kernel.org
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

Em Tue, 5 Apr 2022 11:00:44 +0200
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi,
> 
> On 4/5/22 10:44, Mauro Carvalho Chehab wrote:
> > At Huawei Matebook D15 two different GPIOs are used to control the output:
> > 	- gpio0 controls the speaker output;
> > 	- gpio1 controls the headphone output.
> > 
> > Changing both at the same time cause spurious events that are mis-interpreted
> > as input events, causing troubles on apps. So, a delay is needed before turning
> > on such gpios.
> > 
> > With this patch, plugging a headphone causes a jack event to trigger the speaker
> > supply, powering down the speaker and powering up the headphone output.
> > Removing the headphone also triggers the power supply, powering up the speaker
> > and powering down the headphone.
> > 
> > Mauro Carvalho Chehab (2):
> >   ASoC: Intel: sof_es8336: support a separate gpio to control headphone
> >   ASoC: Intel: sof_es8336: Huawei Matebook D15 uses a headphone gpio  
> 
> There is something weird with the patches here, at least for me in Thunderbird
> both patches show up as nameless attachments to emails with empty bodies.

Weird... I tested here on Thunderbird (Fedora 35), reading it from the ML
and they opened ok here.

There *is* an issue on such patches though: they ended using my past
e-mail :-) 

I'll re-send those with your ack using the right SoB/From
mchehab@kernel.org.

> 
> After saving the attachments the patches look good to me, so:
> 
> Acked-by: Hans de Goede <hdegoede@redhat.com>

Thanks!

Regards,
Mauro
