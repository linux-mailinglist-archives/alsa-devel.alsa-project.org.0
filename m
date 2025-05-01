Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTP id 33C07AB7F27
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:47:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC4106148F;
	Thu, 15 May 2025 09:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC4106148F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747293748;
	bh=Itg065LhDRorZA0J2NZH60yb7a1hVcb/Bdr1CPrif8o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MxFOZKWViZ1OPgq+lgYky6w58LOIfzGaDhpcSuHzb5wTwB2QodBazjDImy302tvh3
	 hrxnRv/RTsHASYDj6WjbD8WXoDJdY+LhfXWObp+u6EWglyhBzyZ+w9HRxZI7cqntPd
	 d1JXVmHdFl20Po9ZoYd9rJQrqFCxXydsTrlYFmPM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F73FF897DC; Sun, 11 May 2025 16:32:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 124A7F897E2;
	Sun, 11 May 2025 16:32:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49D90F8EBBE; Fri,  2 May 2025 00:17:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 035BEF8E9FB
	for <alsa-devel@alsa-project.org>; Fri,  2 May 2025 00:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 035BEF8E9FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uVYY4Wq/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6633D68474;
	Thu,  1 May 2025 22:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF444C4CEE3;
	Thu,  1 May 2025 22:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746137824;
	bh=Itg065LhDRorZA0J2NZH60yb7a1hVcb/Bdr1CPrif8o=;
	h=Subject:From:Reply-To:To:Cc:Date:In-Reply-To:References:From;
	b=uVYY4Wq/Jpjp51lQc9DMyTjTYvlMlbqDuLsTWw/GRWDqn0ovLeyr6KypSDqiJopYo
	 GT1r51Fpd604DW6Zs9CsY1Ix9pJ2PTIgfagSHTSaQCpVEvuN0gRuC11nANTPYp3IhG
	 nHUIfr4iIhQXmFUW/3ilX9v7kXVdbSkjT9E3h6gakyJ9JOcMb7XzZfc5p69fVXETWi
	 lwKqixu6BNSWUjqBiwe/7/7GqznWlPVjMkhvQ3LG/AnrSlCxo+jFUQ+TQXa/i0peAf
	 35y/uMRs2J00kq7cIlKpMkR7Kvh2/J2QRUKyZyqUIzGJ++XQu3iR+F63g5f4OTOaA4
	 tJyWxhStvmsdQ==
Message-ID: <3ba81b7f7859de8ac64e4cf07cc5aa21c3850ae9.camel@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: amd: acp: Fix NULL pointer deref on acp
 resume path
From: Niklas Schnelle <niks@kernel.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	broonie@kernel.org, alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
 mario.limonciello@amd.com,  Liam Girdwood <lgirdwood@gmail.com>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?=	 <u.kleine-koenig@baylibre.com>, Greg KH
 <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."	
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Date: Fri, 02 May 2025 00:16:59 +0200
In-Reply-To: <20250425060144.1773265-1-venkataprasad.potturu@amd.com>
References: <20250425060144.1773265-1-venkataprasad.potturu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-MailFrom: niks@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CQDUEHMN7VVI4BZPNH4GBZAXB5QQB3RK
X-Message-ID-Hash: CQDUEHMN7VVI4BZPNH4GBZAXB5QQB3RK
X-Mailman-Approved-At: Sun, 11 May 2025 14:32:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: niks@kernel.org
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQDUEHMN7VVI4BZPNH4GBZAXB5QQB3RK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 2025-04-25 at 11:31 +0530, Venkata Prasad Potturu wrote:
> update chip data using dev_get_drvdata(dev->parent) instead of
> dev_get_platdata(dev).
>=20
> BUG: kernel NULL pointer dereference, address: 0000000000000010
> Call Trace:
>  <TASK>
>  ? __pfx_platform_pm_resume+0x10/0x10
>  platform_pm_resume+0x28/0x60
>  dpm_run_callback+0x51/0x1a0
>  device_resume+0x1a6/0x2b0
>  dpm_resume+0x168/0x230
>=20
> Fixes: e3933683b25e ("ASoC: amd: acp: Remove redundant acp_dev_data struc=
ture")
>=20
> Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>

This is the first time I see an empty line between the Fixes and the
Signed-off-by tags. I checked checkpatch.pl --strict and that doesn't
complain, but I'm curious now, is that a subsystem thing since you have
it in all 3 patches?

> ---
>  sound/soc/amd/acp/acp-rembrandt.c | 2 +-
>  sound/soc/amd/acp/acp-renoir.c    | 2 +-
>  sound/soc/amd/acp/acp63.c         | 2 +-
>  sound/soc/amd/acp/acp70.c         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
--- snip ---
> index 6d5f5ade075c..217b717e9beb 100644
> --- a/sound/soc/amd/acp/acp70.c
> +++ b/sound/soc/amd/acp/acp70.c
> @@ -182,7 +182,7 @@ static void acp_acp70_audio_remove(struct platform_de=
vice *pdev)
> =20
>  static int acp70_pcm_resume(struct device *dev)
>  {
> -	struct acp_chip_info *chip =3D dev_get_platdata(dev);
> +	struct acp_chip_info *chip =3D dev_get_drvdata(dev->parent);
>  	struct acp_stream *stream;
>  	struct snd_pcm_substream *substream;
>  	snd_pcm_uframes_t buf_in_frames;

Hi Venkata,

Yesterday I ran into what I believe is the issue fixed by this patch on
my very recently acquired Framework 13 with a Ryzen AI 340. While I was
still bisecting this I found a thread[0] of Jacek Luczak having
bisected this and the revert at least solved the suspend issue for me
too, though I was still getting a sound subsystem related crash[2] that
looked related so was waiting for a proper fix. As a side note you
might want to consider adding a Reported-by tag from Jacek.

I had mentioned this on the Framework forums[1] where Mario Limonciello
helpfully pointed me at this series. I just tried your series on top of
v6.15-rc4 and suspend now works. I also haven't seen the other crash I
was still getting with just the revert from the previous thread. And
sound still works too. So feel free to add, or ignore, my:

Tested-by: Niklas Schnelle <niks@kernel.org>

Thanks,
Niklas


[0] https://lore.kernel.org/lkml/CADDYkjR0JG_JTQeQMAvUJvtb9RxFH6_LzV2Fr_1cn=
qPTgV_Z8w@mail.gmail.com/
[1] https://community.frame.work/t/regression-framework-13-ryzen-340-doesnt=
-wake-from-suspend-on-v6-15-rc4-works-fine-on-v6-14-4/68514
[2] https://pastebin.com/pR54sve3
