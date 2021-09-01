Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DD13FE56D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 00:24:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 074901781;
	Thu,  2 Sep 2021 00:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 074901781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630535056;
	bh=ZZG9wwq1DZBwFv+reZZ69SL1yOq7X0M+IBqcs6mJVVo=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YZfgBY3mYTlA84RJzjhb0PwSRzzuSfJ2fqNhgNtfo0AS3ChYffn4jFle/o+KlF9Vn
	 roUhGt1o+jLy5DRr3tubgSyImUkrmkJ/irzVX0rRII72diOozOx6aqRgC0W/z0XXsw
	 KHWK1rpbKS7blxct8bMHOEdtB4AfVfd21HS9wh/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75EDAF80256;
	Thu,  2 Sep 2021 00:22:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B153F80254; Thu,  2 Sep 2021 00:22:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9960F8020D
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 00:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9960F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com
 header.b="ebEJHtCn"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9723B22574;
 Wed,  1 Sep 2021 22:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1630534962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DWJrMzEWBuM2rpJ0aQN/ytOuX0/3a/I0DtswJ91yVDM=;
 b=ebEJHtCn9pWold0Rzuxeso9drnvm6rEllIWGHCD+rYTkH2Y+0GkzQTy28wAznTKPOtNrkM
 kPjw6ZvYbuOckAby79iqgu7BGem63cwLda+qSkydd60NKDu6GZ0e61g7rX5fl0hkW69MSZ
 wJxzbpn9aZJQJKq7x236Nsmx8RC0lOE=
Received: from sbahling.udp.ovpn2.nue.suse.de (sbahling.udp.ovpn2.nue.suse.de
 [10.163.42.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 33586A3B95;
 Wed,  1 Sep 2021 22:22:41 +0000 (UTC)
Message-ID: <863ced0270f42c9f121a8ffccd88f45ce416ff57.camel@suse.com>
Subject: Re: Changes in ALSA firewire stack at Linux kernel v5.14 release
From: Scott Bahling <sbahling@suse.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Thu, 02 Sep 2021 00:22:32 +0200
In-Reply-To: <f8c93441-2f24-48d3-b6e8-76dac7441b41@sloti41n14>
References: <f8c93441-2f24-48d3-b6e8-76dac7441b41@sloti41n14>
Organization: SUSE Software Solutions Germany GmbH
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-K9kLHQYKt8iwNzbBwUJw"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, marcan@marcan.st, wagi@monom.org,
 stefanr@s5r6.in-berlin.de, ffado-devel@lists.sourceforge.net,
 linux-audio-dev@lists.linuxaudio.org
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


--=-K9kLHQYKt8iwNzbBwUJw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

On Wed, 2021-09-01 at 17:20 +0900, Takashi Sakamoto wrote:
> Dear all,
>=20
> I'm a maintainer of ALSA firewire stack. Linux kernel v5.14 was out a few
> days ago[1], including some changes in ALSA firewire stack. The changes
> bring improvement for usage of including drivers by solving some issues.
> I appreciate the users cooperating for it[2].

This is great news! I have been eagerly watching your recent commits to
the firewire stack hoping for a working media clock recovery
implementation for the TASCAM devices. I just quickly compiled the
drivers from your git repo and tested them on openSUSE Leap with my FW-
1884 and the missing frames on playback seems to be resolved. At least
spectrum analysis no longer shows the audio corruption that I used to see. =
I will keep testing, but so far it looks promising.

Also, I noticed a huge decrease in xruns. With a buffer size of 1024 at
96k I was getting an about 20 xruns upon startup of Jack and an average
of 5 per hour. With the updated drivers (running the same kernel) I was
surprised to see 0 xruns upon startup of Jack and remaining at 0 over
time. I have been able to decrease the buffer to 64 samples and still
maintain 0 xruns over the last several hours. Seems to be a great
improvement.

Thank you for your work and perseverance!

Regards,

Scott

>=20
> This message includes two topics about solved issues in the release:
>=20
> 1. get rid of playback noise by recovering media clock
> 2. allow some applications to run without periodical hardware interrupts
>=20
> and another topic:
>=20
> 3. device aggregation
>=20
>=20
> Let me describe the two topics first.
>=20
> 1. get rid of playback noise by recovering media clock
>=20
> Many users had been reporting playback noise since the initial version of
> each driver in ALSA firewire stack. The cause of the issue is complicated
> to explain, but let me roughly summarize it to a point below:
>=20
>  * mismatch between audio sample count in playback stream and the one
>    expected by hardware
>=20
> Since the initial stage of ALSA firewire stack, included drivers transfer
> audio data frames per second the exact count as sampling frequency,
> which is configured via ALSA PCM interface; e.g. 44.1 kHz.
>=20
> But it is figured out that it is not suitable for many models. For recent
> years, I've measured actual packets from/to various models with Windows
> and OS X drivers[3], and realized the below phenomena. Here, the configur=
ed
> frequency is called 'nominal', and the measured frequency is called
> 'effective'.
>=20
>  * the effective frequency is not the same as the nominal frequency, less
>    or greater by several audio data frames (<=3D 10 frames)
>  * the effective frequency is not even in successive seconds for some
>    models
>=20
> The phenomena mean that it is not achieved to transfer samples for playba=
ck
> sound by nominal frequency, and computation for even number of samples pe=
r
> second for some models.
>=20
> Additionally, in isochronous communication of IEEE 1394, part of models
> support time stamp per isochronous packet[4]. When parsing the sequence o=
f
> time stamp and compare it to frequency of samples included in the packets=
,
> I realize the phenomena below:
>=20
>  * the phase of sample based on computed time stamp shifts during long
>    packet streaming
>  * before and after configuring source of sampling clock to external
>    signal input such as S/PDIF, neither the effective frequency of sample=
s
>    in packets nor the sequence of time stamp in packets have difference.
>=20
> The phenomena give us some insights. At least, the phase of samples is
> not deterministic somehow in driver side. It is required to recover the
> timing to put audio data frame into packet according to packets
> transferred by the hardware. This is called 'media clock recovery'[5].
>=20
> In engineering field, many method of media clock recovery has been
> invented for each type of media. The way which ALSA firewire stack in
> v5.14 uses is the simplest one. It is to replay the sequence in
> transferred packets[6][7][8]. The result looks better. As long as I
> tested, it can cover all of models supported by ALSA firewire stack.
>=20
>=20
> 2. allow applications to run independently of periodical hardware interru=
pts
>=20
> ALSA PCM interface has hardware parameter for runtime of PCM substream to
> process audio data frame without scheduling periodical hardware
> interrupts[9]. PulseAudio and PipeWire use the function.
>=20
> All of drivers[10] in ALSA firewire stack now support it. Linux FireWire
> subsystem has function to flush queued packet till the most recent
> isochronous cycle. The function is available in process context without
> waiting for scheduled hardware interrupts, and allows drivers to achieve
> the topic. In most cases, it's done by calling ioctl(2) with
> SNDRV_PCM_IOCTL_HWSYNC. The call is the part of routine in usual ALSA
> PCM application, thus users do not need to take extra care of it.
>=20
> I think these improvements and configurable size of PCM buffer added in
> Linux kernel v5.5 brings better experience to users.
>=20
>=20
> The rest of topic comes from comparison to what existent userspace driver=
,
> libffado2[11], does.
>=20
>=20
> 3. device aggregation
>=20
> Some user pointed that it is not available with drivers in ALSA firewire
> stack to aggregate several audio data stream into one stream. It is what
> libffado2 does. Let me describe my opinion about it.
>=20
> At first, let me start with fundamental attribute of audio data frame. In
> my understanding about ALSA PCM interface, audio data frame is a unit for
> audio data transmission. The audio data frame includes the specific numbe=
r
> of audio data depending on hardware; e.g. 2 samples for usual sound devic=
e.
> The fundamental attribute of audio data frame is to include the set of
> audio data sampled at the same time.
>=20
> The goal of aggregating audio data stream is to construct an audio data
> frame from some audio data frames for several devices. It means that one
> audio data frame consists of audio data sampled at different time.
>=20
> As I describe the phenomena about nominal and effective frequency, each
> hardware seems to run own unique effective frequency time to time[12], at
> least over IEEE 1394 bus. Additionally, we have the experience that the
> hardware is not aware of sequence of packet with nominal frequency for sa=
mple
> synchronization. It might be legitimate that we can not pick up audio dat=
a
> frame which consists of audio data sampled at the same time even if they
> are transferred at the same isochronous cycle[13].
>=20
> When achieving the aggregation, we would need to loosen up the fundamenta=
l
> attribute of audio data frame, by accepting the range of sampling time fo=
r
> audio data in the frame, or need to implement one of resampling methods
> to adjust phase of audio data to the frame.
>=20
> Although the aggregation is itself superficially useful, it seems not to
> be a requirement to device driver in hardware abstraction layer of genera=
l
> purpose operating system. It may be over engineering.
>=20
>=20
> [1] Linux 5.14
> https://lore.kernel.org/lkml/CAHk-=3Dwh75ELUu99yPkPNt+R166CK=3D-M4eoV+F62=
tW3TVgB7=3D4g@mail.gmail.com/
>=20
> [2] The cooperation is done in my public repository in github.com:
> https://github.com/takaswie/snd-firewire-improve
>=20
> [3] The method is described in the message:
> [alsa-devel] IEEE 1394 isoc library, libhinoko v0.1.0 release
> https://lore.kernel.org/alsa-devel/20190415153053.GA32090@workstation/
>=20
> [4] The resolution of time stamp is 24.576 MHz, which is the same as
> specification of cycle time in IEEE 1394. The method to compute time
> stamp of packet for samples in the packet is defined by IEC 61883-6.
> We can see integrated document for it published by industry group:
> https://web.archive.org/web/20210216003054/http://1394ta.org/wp-content/u=
ploads/2015/07/2009013.pdf
>=20
> [5] I borrow the expression from IEEE 1722. We can see specific term,
> sampling transmission frequency (STF) in IEC 61883-6 to express similar i=
dea
> of the media clock.
>=20
> [6] [PATCH 0/3] ALSA: firewire: media clock recovery for syt-aware device=
s
> https://lore.kernel.org/alsa-devel/20210601081753.9191-1-o-takashi@sakamo=
cchi.jp/
>=20
> [7] [PATCH 0/6] ALSA: firewire: media clock recovery for syt-unaware devi=
ces
> https://lore.kernel.org/alsa-devel/20210531025103.17880-1-o-takashi@sakam=
occhi.jp/
>=20
> [8] [PATCH 0/3] ALSA: firewire-motu: media clock recovery for sph-aware d=
evices
> https://lore.kernel.org/alsa-devel/20210602013406.26442-1-o-takashi@sakam=
occhi.jp/
>=20
> [9] SNDRV_PCM_HW_PARAMS_NO_PERIOD_WAKEUP. When the PCM substream has a
> flag of SNDRV_PCM_INFO_NO_PERIOD_WAKEUP, it's available.
>=20
> [10] Precisely except for snd-isight.
>=20
> [11] http://www.ffado.org/
>=20
> [12] Precisely the hardware looks to run own unique media clock over
> IEEE 1394 bus.
>=20
> [13] For precise discussion, the knowledge about IEC 61883-6 and vendor
> specific method for packetization is required.
>=20
>=20
> Regards
>=20
> Takashi Sakamoto
>=20

--=-K9kLHQYKt8iwNzbBwUJw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQjvzoZ9RLbHiUT/sAst8aI6UpxIFAmEv/SgACgkQAst8aI6U
pxJGZQ//fRlQTFFYGXq8tEy9u3qJRmDFvg9may7eXjHspVu2F9PD7NlmtDlKN4GP
sH6XncH5mpRar1wbxzIV6xfyaJGpGWK/J5lFxb6lGA/QUoRPRTVp1ynlFZN70X8c
iryvcdq+3cmNpqQwV34VLxEYGniBOcVRnKBJSrp0dkmQ+XLgdC3vYXTlPiycSs0F
wLvuaWMnyYxTAJwdI1qxM2VB2NN1/t/yrJIrWn2C8yJ1E5Wpkip4NJ7F5bjeXbz2
6IRB6FXEn/2H36btkxM709YB6+FqvHrxdzh7rJo8ytFY+H36sQav1kP+47M1ddnI
SPJDi0bEPCBUDri8DcSkU6JwbmhgDFXTjiWnQfo6cP4DcY3+gIA4UMKrAfkRBlkn
/WGwBUPirhCp0XsOC5Q7nVS9phur4NYQcgl9dwuuketHYJO+Gom+sapkBNXd1X4V
Vkk9iV20KPQdS7tC44jWfDsTMuFE+LKl+KUJp6QVLg7vgfYhzXd3IQFUx9vzTrLw
orIdn8uupXg+udC1fjRbIN/fI4L+qMv3QaKLN8OUfXxn+BQT8yj4bJukgmBgc10Y
NSdEm3y37bpVA+LIZGSUAJqzuYBZKc6MMQeLgIOsWwyllmnUGUDCYAKz7i9ktjo6
kLuFt9EkwnOmzGFJWhwnLlvwasfQs7LABQxRSic3fAKUXApl2To=
=SpaG
-----END PGP SIGNATURE-----

--=-K9kLHQYKt8iwNzbBwUJw--

