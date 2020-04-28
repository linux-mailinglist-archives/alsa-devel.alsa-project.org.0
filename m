Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEF61BB7EA
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 09:45:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CCD6168C;
	Tue, 28 Apr 2020 09:44:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CCD6168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588059915;
	bh=Rwhd6oWso29M10wbukW5ffukdU/ijJTGEwsWj97v0fk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q5Z+5ZWUdc8B7Ppqco/2oNuspVP/p1NFYZhNOgNrTbDyqbq8HCEvIassd8Ey+t4HA
	 BHjdkOkCiRT9TOh5/tjlDu8Slk/SAEH0+VZOIJSG9pxGGw3zS5NgXGtkF3T5aIqDaj
	 ZD3ZxgOkHf+wo3JbZ3NAiTcIfIdsNDRDfeErWX/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99217F801EB;
	Tue, 28 Apr 2020 09:43:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F32E2F801DB; Tue, 28 Apr 2020 09:43:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mout.gmx.com (mout.gmx.com [74.208.4.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A88C5F800B8
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 09:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A88C5F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mail.com header.i=@mail.com
 header.b="lH1BiMWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
 s=dbd5af2cbaf7; t=1588059797;
 bh=Rwhd6oWso29M10wbukW5ffukdU/ijJTGEwsWj97v0fk=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=lH1BiMWKqH0Cu4AxxFShoMjtGfR+hU56qZmhBtaJYNwpqSCxLu1M/Hfla8yeFQBDv
 rjapNlRB6Uwg0mqMODi5qipteax+jV3YQveDlWuazQdVcPjvz/52lAi3gIS6j8RkiH
 nkEG9T2KU+hon3F0Vv240VNwIlgx/tiKB1FSDiYU=
X-UI-Sender-Class: 214d933f-fd2f-45c7-a636-f5d79ae31a79
Received: from [125.236.144.10] ([125.236.144.10]) by web-mail.mail.com
 (3c-app-mailcom-lxa01.server.lan [10.76.45.2]) (via HTTP); Tue, 28 Apr 2020
 09:43:17 +0200
MIME-Version: 1.0
Message-ID: <trinity-86378cc8-0b7e-4b09-ae35-8342d01fae5c-1588059797517@3c-app-mailcom-lxa01>
From: "robert rozee" <rozee@mail.com>
To: alsa-devel@alsa-project.org
Subject: underrun problems after setting parameters with snd_pcm_set_params()
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2020 09:43:17 +0200
Importance: normal
Sensitivity: Normal
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
X-Provags-ID: V03:K1:rInWgGlVwxksXa8LUPJgTgIn/YmwO5mAWzzGp7AcIPp6fE0nUr9gndgKfydYm45FSEFoe
 Ic0WMmdWum+OdHECYwH00EyEqkrlS4zqW7t/pH9STox4J1o1e7PQ1rCWiBFyk3+VJIAZGrpWnfzb
 sGhUlHYuEgwHLVrLYy0RQH4zMkKflm869WNAljbWeYc+pigfOYGOaAa6A4RwnvmUBqAcUeMKbCw0
 ta7X82a0AZu1T+VIV5BA/69a8mGc3PWyfhTQniBsL04glfYgczrwEv4ZEmhhAdvd9EDiRwp9svur
 Bc=
X-UI-Out-Filterresults: notjunk:1;V03:K0:a/Y+DYXg0BQ=:m4hS97CE33wAsu1kfcbn4u
 u2n6S6owDTGbnOCFN2/kNRpFlXkSJN5gznnN6+q81ttk322aP/ZJ/4Ol0UJgSPBeRDN4rjmOq
 6FnVo7QTw+jXa8c8JIysJY4aSS3jlMtbKYaqh5RLvC3P9Zy7avOuQPzWsQg8YqxdTf6FpW/rf
 oFp+jqhOFHjhZQFANr60HV/uvCiBRQTsKc+Zb9pim7vL7fbC9X+DNn58Z50Z/PW6D0ipmO/0N
 aXSreHzpC0l3f9EKXffeEFTLGUTZYcORe9Iqy42ePldvXK8y7/g7X6ZUR6xn9baqhRgp46nMA
 rIq0ODvrZzBwG4oE/Pg6OfB32Y+Kz3w4AquDliiCZ2TkpnUVjh9HGgv9fZrw8dIWHkNteu+E6
 K8ezZcbmqfvMeF7enkfF9LJhPmQxsWs8TygLSWuz2xSd8QkHPNx6uE7+eEDr5jzZKvBSDRSn7
 LW8iruihxlLOYwcBF/QZaDSztsqsDLpgzX9hjSD+buA9WZ89aHEM68GPpDL8UPZWthAlhfBbz
 7EcADFd49QMQcdvNkoC4wvNAuSTUD6gw5WIv6XEpJpK7Y+9YlIytO48kT5rSPphxloQsVR+U+
 LnkYPumPAj4TD7Xtzjy2a2XZhuDckKl3hTzWmngpuptBx7lxEkrcuUPtNmjC3w+o15Ed8gElm
 iAl61A8n1paHqr8KLcEA/wGhChyemmgC5XQM2Kk/MssFFATe7Gd/9faUT+IPDghPA/6U=
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

hi,
=C2=A0=C2=A0=C2=A0 i'm having some problems using ALSA to stream simple so=
unds on one=20
particular netbook running EasyOS, a cut-down 64-bit linux distro that is=
=20
rather slow=2E
=C2=A0

the problem only occurs with SHORT sound clips=2E i found that clips longe=
r than=20
1111ms played without flaw=2E clips less that 500ms generally failed to pl=
ay to=20
the end, but there was no error code returned=2E

clips between 501ms and 1111ms generated the error message:=20
"ALSA lib pcm=2Ec:8424:(snd_pcm_recover) underrun occurred"=2E

my buffer size is equivalent to 500ms=2E

the code essentially does the following:
=C2=A0
-----------------------------------------------------------------
snd_pcm_open(@handle, "default" , SND_PCM_STREAM_PLAYBACK, 0);
snd_pcm_set_params(handle, SND_PCM_FORMAT_U8,
                           SND_PCM_ACCESS_RW_INTERLEAVED,
                           1,                           // number of chann=
els
                           48000,                       // bitrate (bps)
                           1,                           // resampling on/o=
ff
                           min(500000, sample_length)); // latency
while (frames_left_to_write>0)
{
//
// CODE IN HERE TO: refill buffer, and set frames_to_write_now appropriate=
ly
//
// send out current buffer content
=C2=A0 frames=3Dsnd_pcm_writei(handle, @buffer, frames_to_write_now);
=C2=A0 if frames<0 then frames=3Dsnd_pcm_recover(handle, frames, 0);
=C2=A0 if frames<0 then break;
}
-----------------------------------------------------------------
**************************************************************************=
******=C2=A0
the problem, as far as i can tell, is with snd_pcm_writei() failing to pla=
y the
portion of the sound clip in the buffer, but returning NO error code=2E th=
e error=20
-EFILE is only generated on the attempt to write a SECOND buffer load=2E

the sound sample i'm using is a 440Hz sine wave tone, amplitude of +/-100,=
=20
centred around 128=2E ends are feathered in/out, so any short playback is =
very=20
obvious=2E

after doing a bit of a search on similar problems, i'd like to speculate t=
hat=20
snd_pcm_set_params() is choosing an inappropriate small period size=2E for=
=20
low-end computers this is causing the underrun issue=2E if snd_pcm_set_par=
ams()=20
is used for configuration, is there any way to change the period size afte=
r the=20
call? can it be set between opening the handle and setting the other param=
eters?


cheers,
rob :-)
