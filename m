Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E15362F21
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Apr 2021 12:18:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A18FE1686;
	Sat, 17 Apr 2021 12:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A18FE1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618654712;
	bh=tAE20brh6Z9qrD9vWE5VEfPzver3St7xxpXQ+PZGyts=;
	h=Date:From:To:Subject:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=N4QQvqXuQsuI+kzr2taNxdGUlpWbcGysh9ZIgIHdFOGpqKbyjPb6ZdyGSmhGsDYuT
	 u+9Kd0REeIQ9BWU6T0BkN6Th7T0/gqX3klbPh5uhpuQr4UqyCcwMPt6z4+rTB+/WMd
	 BYFAh+Tnauy7hXcv0yxHtPKjV1LhShpicmfZ/GiI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11495F80108;
	Sat, 17 Apr 2021 12:17:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8F25F8022B; Sat, 17 Apr 2021 12:17:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sonic312-25.consmr.mail.ir2.yahoo.com
 (sonic312-25.consmr.mail.ir2.yahoo.com [77.238.178.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 545FFF80128
 for <alsa-devel@alsa-project.org>; Sat, 17 Apr 2021 12:16:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 545FFF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="RdMjyoXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1618654610; bh=sOK5rKqWNWfziRnrZpBVt5AdNJoTigCR8dZIGGDsFFY=;
 h=Date:From:Reply-To:To:Cc:Subject:References:From:Subject:Reply-To;
 b=RdMjyoXshiImwHZr5hKgatXpx1dwwBhhn42TquJFqm7lymYhLak/Htr5S75P9yNY8kPeoaC+NS82CLJCAbh8yD4mZFEZ4ER+LCdmAoabGN9LPWQTrIl0YVZBROo8hr1cjvqQEKApBa6E7ZwB3sgke0Lypzk3cfQXV+p7saqDze1YZcZauZc9Xd6jhRtkSHzhFdaiVCmg2+itMzsJ2CFYBFPQkE5RaYleVjcUTvU7NsmqgfIbYOLtcreo5/SEPuHdD5OWxlVdspT6/h5WB22915PuHcfddRJXMt58hwZW0kVznG9vZea0aPWZ8ctbiftiHkki4Bp/VBEo5tBAWzjwFg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1618654610; bh=YOoqcr2KtesklNGWkMzgEzKkL6bMelqPTVzMlkTKtjg=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=ZeGNiw9D3o0n5yukswZNZ5eAqtJQGDaWIZM9esuzHpsPTHPZwIYMHTs9iZwYz1GvBGWNsG9qr0x66s8eKwYJy1DLmKfdbQNN1Yrq8/HyQIgPuCaif5d15PCaaV+XpA/wouBEQKjpMNDKdA2Cdni3h8h8rgvJdjeNtIWaNlWfnbBqoE6SybVQKtgK8OTvXJBMj1svs8UQFM8kXlqZIgIOX90VCZY0iTV91vNBfTr/FDy+Jky+y5o/Bj3kftiDV2FfddjTOM1B43OCdfkPGTEUpJ10Aex8lLr2IGUZ8LjeFqwELukbGkRx8u9Opl7WYCDAfPagePhdFupO1dgaT24+iw==
X-YMail-OSG: I3a.D_YVM1lx77oXcjJkmyG5i.fODsp3tV7M0oC3QcJsUD1_OOEXFYmOLDLN5Dk
 a8kcJ0EpKX1RowBIyt7Tij1.LfGK2GfvruQH3AQL49TJI2eJJ2ui5HvKy.OSP4QBQzRKqOstohHp
 KM2jPgul0wYhlZ8wPBDme4GYRdb4hyw9I1tkx6XjJtX7sCIs.2.7esXarjEv3c6bsCjCKIPFFUso
 9034MGRGJDA8LhUrAQKUyj27t.jc3PCfQRijhtb_cGpRTx4GMd58o2l4lsM1dRSTUmGDRVBovRl.
 TwLJ38LCSIP8xzdqoTkL.pbuGNT3nBTKx4cSsPdeUbB38CZYCZizLnI9.B6Rq.bNO7YjI_.RXU5h
 2v_pYzKeEwxQbUrB2UvvLkTb02g.Uf8JkFeumHKbQtGVYRY0wLl2UaKzXx2IZEKT4NEoQkkdkMUH
 5NwTAwSyuB7FzcnYL6rnu.rEizrZysrElcqYXNwsXlPbXMxWrQNMM5O7YowuUJ_zMCQhtB9xfuJ2
 Gm6DLsCoANadoQ4K.B5VVgV3t24CDG46LIryEf90_HZUa6x5Rg3CmdFFhP6Ncr9zVFabD1L6aqn1
 BZaGLlTywqbj24qHQ4pskUnWZ98tJSjqw6ZYmphlzbjXREWT2khQ_Sn7LsyAMpFvSkzRQVTaRbCz
 4EqaZXWdKXjN8CmRA1QIm.cty_oZvRQlgHQ4DD1SYu407La2PnXYw7Gm6xUfVwUm2VeT9yQhY_n0
 Mj7J9Pa4EkSdXQ2CtV07Gwe88.rnXKBm9GzqxLTND9wplLhsXbLzuJsxMBC4yWaSV4b1FfyGLB76
 nYwQw.s8PMsBRUgqjQKuOPN0OIw4e5QJviaHVPVg1QObBa.YwDRgw8aAXxc0FNaksGTGVjbh2xAc
 521dcIN5L91HEzgNEeGjL9aTPaRlSmjxNAwrUYK67mFhcbePaqJdG7Xpr4SB4oh273UenzQl9kuF
 M5_OTmoobfqmiJ7UP6jK3aPvAauq6_8q8Dwl4_2VTCnPy797evU3_vkyAnHA74zkYI5Ff3eXKDuC
 fv.arqCxgvES8xW7txL0GWkE.lzluCYo5HZs0Ru3wMfpBOQUCtiaNfwT3IwNlxaDUrmnvidpcVaZ
 gAvgl_bjoT9fRKV6LprlN_DGcUUSopMtiG2XxNb.PIrFAK.GQdDLr5IdMMGAnsrs5CcSR7Bf3Ke3
 7ZTWsfdHsVwQVReLY3mS3dNEdAOGJqH7bS8udCaHQMu832aIr2HjXHQh_bMhRuFkS_8q9UoR_BC4
 BPofWOT3q8bqKkD3m7c6RDbDE8puo8c8VEZD.ABO6iXWavpTo6tQVx.jI0YLwwHHlDXM7Te6qExp
 _EJpZ9AzWEbvGRWPmEpRhGv5ajsOx5HEGYJL4Y.Hd5dJionRhK_OZQ38HpEedK8gaEwMtvwuG55A
 qtfYKCAF5uKE2UzH82Hd_W3yYt2B5ywjEmqrp7wGLb_om3HfY8IZz9vk_1ECQvWPhqW.MgMHh_d9
 ssRcMSCw32_SJc6U59dIxOLMmLq.r_G4yO_pdn7JxuWjsZxbKl1_4aM0tbKvo29TfPa1zxhCSvup
 GkO60YrDv1Uyo2YXVDojNUmhZyNNo9x5lHfB6658ExWS4RRTUerRuYkdAePYW6MZPGycdmiSW9OJ
 nZyKaJ8HU8Wi9x40PI42AcGl2X7yi8_cdoeQsxcSaLZfKw.QDPuYRuJtEC49qKlKnTRELII4dZYA
 4ssvCynDgfc4AEbOHtIU2EHDGH3qsuLP7JnE2reBi2xRYzSJzygjRafGjqL9SHvVkgAl0wKjBjAY
 jV13LL9Twxa.D8wUEkCxPJ_P5wmYk6kEdoORvJ1uVSrGFoNc55hSCUqSF3ZKNcD8t7NITtKX3dYH
 TXo2X.PYI6.bNiMxiPCOXViLhHvtV_OXkY2di1k7UNFvgpuuXHrOpL6nlr50oP_8DHgxmRKGg9UC
 G0H.4eZVPxnYGGvPezBhs5jCDWccrfop.NiFxb0bUS9ZDrU3Df7JypbAPRKgcwrYCP7.Zj77NTdV
 kNy_Swq8G.upq.EYdFJETkPt5sv0wmBaj_xV09dzL3VeZo4jsrjUlbtHtDu4O5sZd4pMYAqEXnMN
 K75NjfWH4mHrBvfytrmUdrKt1C4T8cJpjnuYbWnf4xJ9.fWkN8K6kAvYISVZxpENtDR0OXiR8d11
 I1xgAN16NCmPNTj8shkpPM9Te0Rnkdr95YDufPPsiMm0bjtkxIqCTAObL9nlPvSDGQ3REUWKFqxP
 xzxjIX.hQrjlv.qC2BcfA16cGEaJBU0PImAv0RoWX4EFfZ1qBpofetxN6uHHvy0eD49PvHIVp2Ni
 P_OjCSwx6WDh.baoqDdQLPxpLecfjG4y4YcjpCa565iBvgSeblKxoKa5PzZ3EoI7gom768N44u0.
 aVGimzCZ2dEweKedSIW7CnvVr7sbLROaYbAZENWQ1RY3OdX4HUzU_D9DRTZkoOmiBduI4jowIHtR
 9HX2NB4nKirUuYcQsLxycr.rDGnJW2_BKEL.y40KqIQhurFMZBc2nq1upwLkT1F3aa3z8YeKKGgC
 qih.6bOZVQjdA9zWOJA.ZwT0LbWzgMon4D2PDCTEmRvDbpSVl1oWHSks6F2YiSo2YgkAmfIqa63i
 N2tGG_scZTQ2fkrS5CW36d2GhEsflBCr3xeJR57_PUN5scN8YyAhXo1jGrn0lA7bYEDukdRn3P2M
 3jYmgpk8t2zG3joXKlOgZ9mBwOQHo6P3ilpkSwQ.j86dtBqW6J_Sji13MsU6j9ivIz6nHlzSn_9K
 8RqhKsmi7HOsEALKQ.eKJg1JmUMEFb1Vcl8EYWIxuOdel6AQ.SZZqNP.PAfa0KzoKxCj5lQf4ruI
 BnRA-
X-Sonic-MF: <htl10@users.sourceforge.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ir2.yahoo.com with HTTP; Sat, 17 Apr 2021 10:16:50 +0000
Date: Sat, 17 Apr 2021 10:16:47 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: alsa-devel@alsa-project.org
Message-ID: <148484793.4894421.1618654607945@mail.yahoo.com>
Subject: ASoc / PCM recording-related regression between v5.4 and v5.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <148484793.4894421.1618654607945.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.18121 YMailNodin Mozilla/5.0 (Macintosh;
 Intel Mac OS X 10_15) AppleWebKit/605.1.15 (KHTML, like Gecko)
 Version/14.0 Safari/605.1.15
Cc: Tzung-Bi Shih <tzungbi@google.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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
Reply-To: htl10@users.sourceforge.net
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

I am trying to find the cause of a rather unusual regression between kernel v5.4 and v5.5, for an out-of-tree driver on the raspberrypi. Everything looks identical between v5.4 and 5.5, within accountable differences, even when I enable dynamic debugging and 

echo "file sound/* +p" > /sys/kernel/debug/dynamic_debug/control

for the whole of sound sub-system. It records fines against v5.4, but blocks on v5.5, and on ctrl-c, does

^CAborted by signal Interrupt...
arecord: pcm_read:2145: read error: Interrupted system call

I have gradually replaced the include/sound and sound/ directories between the two (the pi v5.4 and v5.5 kernels are separate branches off linux-stable, so one cannot do ordinary bisects), and narrowed it down to the following 13 commits from 5 people: 

4104faaeeda0e23a169c50e43f309ff7435087b1 ASoC: soc-core: disable route checks for legacy devices
4bf2e385aa59c2fae5f880aa25cfd2b470109093 ASoC: core: Init pcm runtime work early to avoid warnings
fb5126778333d289b2623a7e6260beeb1ac1b819 ASoC: core: add SND_SOC_BYTES_E
dc73d73aa7145f55412611f3eead1e85ae026785 ASoC: add control components management
509ba54fcfd1e45bceebe8ccea59dc496312f1a0 ASoC: soc.h: dobj is used only when SND_SOC_TOPOLOGY
e443c20593de9f8efd9b2935ed40eb0bbacce30b ASoC: soc-core: don't call snd_soc_dapm_new_dai_widgets() at snd_soc_register_dai()
5d07519703bc2f0bf19d33652401552a480d68b8 ASoC: soc-core: have legacy_dai_naming at snd_soc_register_dai()
e11381f38f34789b374880c4a149e25e8d7f0cfd ASoC: soc-core: add snd_soc_unregister_dai()
4baabbf932ed4f97df8e18cf546d39b7c2138020 ASoC: soc-dpcm: tidyup for_each_dpcm_xx() macro
2b544dd7b43b19fb55ea4fbb3e30b60eb20b7828 ASoC: soc-core: add for_each_rtd_components() and replace
33536a14879515949b065721cdb7fedb276d8e8a ASoC: soc-core: remove for_each_rtdcom_safe()
8ec241c495dde3d19a0459304298c2468c60182b ASoC: soc-core: add snd_soc_pcm_lib_ioctl()
b7c5bc45ee94a03a0dc45a862180e17db8ea8e9d ASoC: soc-core: merge soc_free_pcm_runtime() and soc_rtd_free()

I think it is overlay / devicetree related, since another audio device of the same family and similar hardware but different overlay works fine. As I already did 'echo "file sound/* +p" > /sys/kernel/debug/dynamic_debug/control' , I likely need some additional debug statement or enable debugging at another part to go further, despite it being a regression in 'include/sound/soc*.h' and 'sound/soc/soc-*'. Building the pi kernel cleanly - from 'make mrproper', copy .config then 'make oldconnfig' - takes about an hour, so switching between the two and compare takes about 3 hours, and quite slow.

I can possibly narrow the changes further from the 13 commits (9 of them from Kuninori Morimoto), but I think some more dev_dbg() is needed as the current ones in "sound/*" don't help; and it is worth bring it to alsa-devel since it is so unusual - all the dev_dbg() in kernel/sound/ and the driver side emits to the same messages, v5.4 can records while v5.5 blocks on stuck system call.

More details at
https://github.com/raspberrypi/linux/issues/4279
and it was initially at https://github.com/respeaker/seeed-voicecard/issues/290 . The "seeed-8mic-voicecard-overlay.dts" is the dts corresponds to the problematic device ;  The one with similar hardware but okay is "seeed-4mic-voicecard-overlay.dts" .

I am subscribed to alsa-devel actually, but receive it in digest form, and haven't opened the digests for a while...

Thanks a lot.

Hin-Tak
