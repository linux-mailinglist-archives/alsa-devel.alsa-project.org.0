Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD7A369107
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 13:23:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA1EA16A9;
	Fri, 23 Apr 2021 13:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA1EA16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619177035;
	bh=J/Lx/io48Nfpmauknl6vY2OedoYBC+SR7rAMyGYEBSE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=JBBGiZM8Tbv2Ig7fnO+64EEjDYX+TNVE5YqM3VFsfm2lTeDrDAEGJw/CUe0aLTz3P
	 NOqgP+6YQNqY2u48VWhofzTLv4exRYBt3thTLhGwPjvwf4EPSdE/TTp6TU3lRHY3SV
	 U/XnqeGrDUKl/GAVYYwFYInH/2nULhtmUNZyRl2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C903F800E3;
	Fri, 23 Apr 2021 13:22:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55EC1F80227; Fri, 23 Apr 2021 13:22:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sonic311-30.consmr.mail.ir2.yahoo.com
 (sonic311-30.consmr.mail.ir2.yahoo.com [77.238.176.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2644CF800E3
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 13:22:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2644CF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="Ol3QfAqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1619176934; bh=Iro8ZN1A6S/J9xu8AypXENro6pWx36YeN6B30jgSX4w=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=Ol3QfAqQEBBFpl5G4kdJfYJmNzCijTud/TMlhLl8fAFIx3msrgzUVViJAgC7m/xIHoKcxzHPQehTWJ3n7MaCQQSUlMoiNSwE5+oSFDwePEky89qcUSTrrq55cA415RSdNHvN4sNIYt7zKeISDfYtNm76EXz6Pj+N80syeQAx8Q/9OxYhnCUnq70Jbr4e+fMORjZ4nuOHa6KV0TG15QgZHqwCvphvzeq//BpPvl/m5P5sW/K/K6B2XqvHKntjBsZBl6ELqlZXc/iMLcz0rcOEl3/0nWa3HlGJ8RfSngQgfvIkPNXFY1YWkvzRwpE8VvdVJ/vRHVQWEBRamaXsJVIz6w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1619176934; bh=3w1eNdQaxCD20J0GbBI8yr5RfjCN8LdKFY1dUsUZ2kM=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=VEdfvdPogXka6bCvb7JStXiEhGi/ehb6zbs/Pl9zzldqZ23X7h0g6MekF4dkmw9TiLnLMXmwsBdHCKYoFDEI6zBbd3XH9SexWwsUq8mk/vG0xLukFJz0Ux2eSnZFBoChr8ZtBY1JAn3VazmYg2uaViJfI4SeCLhNYFNVUPlrJ210zAsuMdAnuCeNLimsRwGD7fffGLQ4C3dNaAAwAuBXw5fODzf0AQhuzk3+nVLo6Wl8TCSYXzN6W5sMx6sr45jAjZOqOsCvY/wUChXCCRD3dcIELSjOqddj+ssXNwz35gEoCvo0hazFN+EHEUaZSXlGjAqFvXwJOQxchLPrmmBWLA==
X-YMail-OSG: h_l.oQ4VM1nXjR.RCXwlz4MTnMBvAJ2b0BnlI9DFBYWBuiacZvNa0AS9Wu1bBYT
 XFsz0t3nhAjmwiubNgjo5Q.QR5XcHK90WSb2.h0jV68rhtMO7gtqagw603wEtSH9oDtxTGsYqqr1
 ldA0ncQpolX7r4hoXPHr2Af7MnIs.JDb8hvWnBL.vtNJV6BffXFk49mp8XmNVsfDEQ061Ae0Nz.I
 C1iJ.3xpWt0Bd4YityQfj24qwHqNrrKmGCsk8wR0.wBh8T1hviBpcj4nJnMlf4XLq0hMRd7YXwLp
 GhpeurFaMOFcsCNCbwi.aZxiSGl4prba22aNVIgCltwCZa2wus0GKiBPNdyeWBPn0hwJjtz.E53f
 4HgaoWNmg8s2QJ2hLkbrXwpCCzniU_CQhGwqkqLFJJdo.jdWrm71F9knkHNEd.Nc_51jGclAI5Kv
 N224yVLeOo6xTL18JP_LukSF0SePn3NGbSngRZkhgOeZCEJZH50hIrXd7VpufBJzpmP6yuwJZyDQ
 B6QcKK4TLbaLG9.Q3RC5jUi8UOjQhjUTfE0k.ozXr1SUc4QPBLGNFQtxVP.Pg6KK2OFBT0eWfl.j
 A169Z59aPGdbLIA98THcO4ZhaI5iNElT7LibHX9eAoEGWeM7LvqKn3_9hKZQJ6ljJAYMrGo3Lcto
 HHeLS7cRCj9uXy3oYvkExnAV1ozDJL4TUgJPmgXWy61Mw.e6bggeryePzf7g_Ml9YBSs5L_sKSE0
 2bIrt9TLIsWDFaAL5RV6mvPCGKP_1q4FF93ce92x6cD9cYi6pQilgeGN4s_JXO2q2bbDTdYNGy5i
 iX8fB7vWgvvtp.EYfFR4bE1Trx3MPSQClp6PTa27eMzQ6l9.CXcvBD3LU4.DRhEaqF4uxXhEFW_G
 73W3.1VSDXvF6NyQkYpNAuzBuCyN1_JYWK1JXHSescg.MugjBPfn2K1oL9Zn.tbrOJPanmbrYVsy
 OS06hS.ATXGQM_VxuFG8x2eEE6979kJaafxTd24qyo0MWxuEnquVPm5GnCkRXkvZmchJPUWfMq8C
 hPv1qLEx40YGK630XLbdmeNy8qIy5H2ggoOeX9hu_0vXXE7uj5YTj0Gu1a8K_g5fd1OEQvf023.k
 n_62MX2YFjv5lUOTad9T8M0DY08B8AblpqGcfo7WFoW5s0htPu7IDrjJcau3S5tBDTg5tGaE4b_k
 _UtG2wUdHFRdbPiGGJnp.5shF8u_Wxug0QnKeI5MUaT9RKbtmaStTQAQkZONA1djqlWnHRigNy5g
 _aBmj5t2hkMdz58Vuio_vfdVHqZa13yG8UPTBWF2L9vQj72wuVI8gB1XbLE7n3zJHQI1KQ0CmYlC
 vTEDfrKp18XIOqxGokyes1msKrTwHeFSgzgcr3fHnymisVXX_an3_jPO2Gq.CWZ8.O0s6WgvAxwj
 3kZXh_z59Dpi7mnp3uUzvBcX7YeCSAn9qC2j1uwE1x0cLzO1ioSuJ8n3aXgSqJurfvKrzFOkNYEQ
 9EIprFVPaqzuQr3.dYtg4jO8XZIQnr6Nwbkinbz.dOZ_4_GJqnGW3iD0N5q5LHc4rhMGw2qZcHb0
 BV5ZvEvS40xcIOk1orgfx8Qj5axlgyL0w.y_DnmehPOanYXEwpyOWKNR7ua9oDy9a4cz9sShQXKC
 nAL86grhuXe5jGqKiqLx003tB0nfjeb4luxYN5WksIhEejG1S3Ua5bgIbmuHgp9UP6IPChKy8UsY
 3zVuPXJ13rT9XlhzTdFCsbOh3eGSlGROYYCFAfSXv9qsCQ7dUjdtxNWgd3bSav59j6FX9nlga4m0
 W2QFiyK9pbXNK_ngvSc0z_PVjLZhHVzFY698oEblXwSO_PzKdiEHb2_2z0q3gYKk4m9xybGC6uX.
 54YVvWBkRrujarO0CMkO3t8QcAhcPKOIJ_.FinD46tS5yp_1Lvmvcqsi_EIhL70Vt6fLqmKYDSWS
 eXBMHJNt6EDXGvQhckycxNJ8UwgVryzC.v70NwRqsOQ5ABwHAfKbFzrNYvm4_A3HKuAqZcH4Enir
 HSeKJRGdDmxY32LzeHs_W58K1eyvMLOuIuNoZY.ULKInrBRV29syXrhntchpkAH8BFbQCax7i.vA
 lEc7_6ZtauCN1rX2TDqlti7.D4sk2pQtxfpKsVjxAyGQhO2bKgG6K2ZljI0LToJ40bLjDyVRREIF
 lQTc10MZcL9kX9vlGTyGa0xvq5513UnZ2mZxE.8J6F_8IsXBIenFF_lQ0GU34kEgVxk8CsABDMmN
 Rd9yax548BzQ.RIhshhhf.e5jCUSxmWfabCGNMC2KJV7IV91wfSGbNNUO8onq138UT5sijqXMULp
 ZlnSnOhGhTdWm9Pj3_aWg3ZJ2m0O76MQc7y1lcmKro76QGiXugMg1vnSh0cBzjXyspKeLCQQif2s
 NZfowTXOgNWpcgaD7VHwng5aDutvwRpqtjuKC8lrH4tENBNeO3vXWHVol7W6V1_LNe6NvKk6uDYc
 RmHt6NjZfCvF6ir.zCPeETqOlgxmuFtzcHWE2f59uYWxsVPMVvvhTdXFTu4AwDltx3Euz6s5SC_O
 TCP.Pl63aCizYmxudBfqIc8BcWILHnuv2gcZKZKVpcYFat_DGVIXt0PJm45y6DNcIU847zKcrFID
 mmOilslan7weM_hAWRyNtmA9GHtge3M0Uc2MC9zS6_ZIhshJVDg6zxzb6GvmUz0YJajZofuoYfCV
 B1OFJv50EqoVedODZYxJ48LxNrfuaeAcQ5qKvynQV2ev5q9DYPDjKT9WbQjktyj3AN7Dxcz6547O
 k_fg0eJPR5SDwcmLjbADFQoq9pNbUTY5b1nKUtAx25k4POkE8Hs4Kkq5LQu.t9WvSsGuAFpH4kae
 g.mxWPgISLR8tmA--
X-Sonic-MF: <htl10@users.sourceforge.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.ir2.yahoo.com with HTTP; Fri, 23 Apr 2021 11:22:14 +0000
Date: Fri, 23 Apr 2021 11:22:10 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <1556414365.8666901.1619176930979@mail.yahoo.com>
In-Reply-To: <ec99afd0-fa6b-71a5-653d-f1ef9687d5ed@gmail.com>
References: <148484793.4894421.1618654607945.ref@mail.yahoo.com>
 <148484793.4894421.1618654607945@mail.yahoo.com>
 <877dkz5hz1.wl-kuninori.morimoto.gx@renesas.com>
 <1772063602.5910217.1618841824599@mail.yahoo.com>
 <87h7k152du.wl-kuninori.morimoto.gx@renesas.com>
 <212419469.6653726.1618928398310@mail.yahoo.com>
 <425493399.6730534.1618934642983@mail.yahoo.com>
 <ec99afd0-fa6b-71a5-653d-f1ef9687d5ed@gmail.com>
Subject: Re: ASoc / PCM recording-related regression between v5.4 and v5.5
MIME-Version: 1.0
X-Mailer: WebService/1.1.18121 YMailNodin Mozilla/5.0 (Macintosh;
 Intel Mac OS X 10_15) AppleWebKit/605.1.15 (KHTML, like Gecko)
 Version/14.0 Safari/605.1.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
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

 On Thursday, 22 April 2021, 15:01:02 BST, P=C3=A9ter Ujfalusi <peter.ujfal=
usi@gmail.com> wrote:

> If you start the DAI first and later the DMA then it works again?
> I'm still behind of the patch which introduced different sequences for
> start and stop.

I am with you on your change too - I think your change makes sense; it is t=
he vendor's driver that needs correcting.

> From my commit the start sequence is:
> dai_link, DMA, CPU DAI then the codec

> Is it make any difference if you try:
> dai_link, DMA, codec then the CPU DAI

I'll give this a try soon. I am just the owner of one such device, and did =
the porting from kernel 4.19 to v.5.4, and now troubleshooting to v5.10. Th=
e vendor has been quite absent... and I feel I perhaps spend more time on t=
his venture than I am happy with... Anyway -=20

> But the codec is usually not handled in trigger, it can not be atomic
> most of the time.

I suspect the vendor did something not quite right in the area to make it w=
ork under the previous wrong trigger order too. More below about spinlock a=
nd atomic context.

> Can you point me to the out of tree driver and the related dts files?
> Can it be reproduced with rpbi w/o any hat? I have one hifiberry but
> that is playback only and if I'm not mistaken the 3.5 on the board also?

For your purpose you can see my fork (which includes v5.4 -> v5.10 migratio=
n change, unlike the vendor's), https://github.com/HinTak/seeed-voicecard .=
=20

The dts concerned is: https://github.com/HinTak/seeed-voicecard/blob/v5.9/s=
eeed-8mic-voicecard-overlay.dts

The card trigger code is in: https://github.com/HinTak/seeed-voicecard/blob=
/v5.9/seeed-voicecard.c

while the codec trigger code is in
https://github.com/HinTak/seeed-voicecard/blob/v5.9/ac108.c
and also https://github.com/HinTak/seeed-voicecard/blob/v5.9/ac101.c !=20

Note that the routine ac101_trigger() is not used, although the ac101 codec=
 itself is involved.
There is a spinlock in ac108_trigger(), which I have long suspected to be i=
ncorrect, and has been known to cause the pi to kernel panic if built with =
PREEMPT ; Now I think it is there to make it work under the previous wrong =
sequence.

There is another device of the same family - which records okay regardless =
of the trigger sequence https://github.com/HinTak/seeed-voicecard/blob/v5.9=
/seeed-4mic-voicecard-overlay.dts .

The problematic device has 8 mics, using two ac108 for 2 x 4-ADC and the ac=
101 for DAC loopback (and as clock master?). The 4-mics record-okay device =
has just one ac108 (and without a ac101) to record 4-channels.

As I understand it, to record / playback for 8 channels on the pi, the I2S =
on the pi transfer data as stereo at 4x the frequency, and the codecs try t=
o start and stop in such a way to avoid channel shifts during the 8-channel=
s to 4x stereo change.

I can reboot between 5.4 and 5.10 quite easily (the pi does not have a boot=
 loader per se - you just overwrite the kernel image in the first fat32 par=
titition...). At the moment I am thinking of inserting some pr_info() into =
seeed-voicecard.c:seeed_voice_card_trigger() and ac108.c:ac108_trigger() an=
d perhaps also in general in ac101.c to see how the driver behaves differen=
tly under v5.4 and v5.10 . And while doing that, have some thoughts about g=
etting rid of that problematic spinlock in ac108.c:ac108_trigger() when the=
 code get re-arranged.

The problem is with trying to record, so I assume you cannot reproduce the =
problem if you do not have the hardware. However, I could certainly benefit=
 from some suggestions and guidance on what to change and how to change the=
 current code.

I am fairly okay with kernel development (in a few other different areas, f=
ile systems and wireless mostly), but audio is new to me.

Thanks a lot for any ideas / suggestions you might want to give on modfying=
 the two trigger functions and getting rid of that spinlock!

Regards,
Hin-Tak =20
