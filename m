Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC10899A55
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 12:08:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 779322D1C;
	Fri,  5 Apr 2024 12:08:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 779322D1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712311725;
	bh=P9W+ZZQct7WCcuVA2dzO5wfwCSITBeI48v1sQMxHgoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vny/mmfBQ/2Orku9jj/JttlPIzCxUCZ8IE+u6v/AUFKFv74BP5YbixNGWyKiMwEas
	 Q31tC/O14j2S2WyfyhY22IAkJD+O0fqG3kkPVOIPlDHxtoirIW0pwtifxSnHGcb3sh
	 ZIU4SrpYidSha+pPegYQOhHb7Z99efkJqYUlXLSk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EF75F8057B; Fri,  5 Apr 2024 12:08:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAAEBF8059F;
	Fri,  5 Apr 2024 12:08:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B9F3F8020D; Fri,  5 Apr 2024 12:08:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C47D3F80007
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 12:07:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C47D3F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=kLsG4/FX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712311678; x=1712916478;
	i=oswald.buddenhagen@gmx.de;
	bh=P9W+ZZQct7WCcuVA2dzO5wfwCSITBeI48v1sQMxHgoA=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:
	 In-Reply-To;
	b=kLsG4/FX3M0M0VCDlCjbdKRPzPktBTOyYUItif93IzTR4XL97HievtTOx7EPaHFu
	 NcJTCypTXx9J14OgORh8E96HTxBPVH6oXnsFRzzATx6hP6Jyzjh/qQ4WM/7iGsjZO
	 +bbkigEG7iMbx+hGxdI223ulZYJid114dJxSdpCyYC5yAWQDYeMz0eIiAXltrvsS3
	 exZx+qlIxnszqsCzvPLE8G+V0R+jZ3m+G5EDiePoI+cC6QS43IT7jIqMLv5AG0Wmi
	 b1FO+7pXUEkvMF/Anyhcl+jGOcow4Y/tE+q5CFIdiDdecpRvmscrxy0l9J59XZRpl
	 C4BaUTSi1gaS1iC+Cw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.116]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPokD-1sDo6P0NSl-00MqQh; Fri, 05
 Apr 2024 12:07:58 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsgUH-t9o-00; Fri, 05 Apr 2024 12:07:57 +0200
Date: Fri, 5 Apr 2024 12:07:57 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2 00/17] ALSA: emu10k1 & emux: fixes related to
 wavetable playback
Message-ID: <Zg/NfajQ3gdsmbUb@ugly>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
 <875xwwnp27.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <875xwwnp27.wl-tiwai@suse.de>
X-Provags-ID: V03:K1:ql/2x59VrlaECHEz+pLdQ/7FSO3yVXngCcR1WaxURDjZD9kxTwL
 wbyGS1xRPi7r+UREmqY1uU6Nfp/vPkYfzcfnfm6XWMBT1GizzVnAxQnM/1p4znbV6ccSIvK
 n11mq4DNDUNI7RNrUoOol5yNB2cAgrqShUAiQRtu7gQf4sCKpT/j0C68FsaA8r5gVNxURN3
 XTgLA1A37vGqJYrUYHJsw==
UI-OutboundReport: notjunk:1;M01:P0:Pj3aAlUMCqM=;9d4dbEte07GzDDW3buXp/SrM964
 trUE/g2TJGnfL/E8wHMTL8IGhsyKtXG/DpZC6tcfCF0y0NrgndxXezJ2FQjn9zofI8kF9nLot
 XaKkj/JfvewbrpAosoXmFvoMeaaLFHGZiIZOT6V6zfCR5cXk45Sij6zqRDoh1vPWEERhw0AZV
 B+0lHXbmVoxBWYkHVh03KPTLrAIPohKEbRUBmeNSZIdmoiJPm/BFrx2GTEMNaJQHvykd6jQLv
 JOCGGcxMwwq1CUlfSxD6bTKZuXH/j4pdNRw0Bd5HEhzSnaVbuPIYbDUGPFGeqRgJ14vKMjOxW
 6nb+DXIPcBX9ReEjL3dZbajIGbBtmVeA3aB2Vvd+djrH+9ct2k/lFHFiqqdDEhZ9l2jpAF8He
 IBOuXofRvRqAx4R1Du64xm9Iq/lh3316g7mr5il/LWkrcFYP895DD+06UHn0AHWvWlAkSdLMV
 KRVVG86lUO/MwGGDebklSjTR7eg8zxrznSIhLuIo/zd9gsNwV2iL6fb7WbrOFGb1BIvHeM9En
 v4eD/4fphnEUkKY3I2I3oxZst+S5TFNc4Umt1mijd36sQesb2mY/+ZB3sF/JTUNQDPfFtLVb/
 I2Y3AE//+ZTtUuTCHafcA34ROv2INSpGwjwQoDYmvEmWJynOxmA0eimOZPe4EEeZDskR2kTUD
 HiX15vyqKTv+z0ZbYBpCThwVaUNTzIfqrwesyYwAUoa7ch3T+Qk+I8OfZOlRJxnkz1BmS2PGJ
 5BozhPb6MnPLZki46/LHrePAWzraQLPnrr4WysDSF0peRhWDsgCSIMvqo3P1KXI/H0GdJVkd9
 8E8wKYPO9jzchSsulTVZp+10MUB4yCeac+QLV3NuBB6cY=
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 47I6GWBKO5IVQLMBMIHMGYTGLX3Y7ZOK
X-Message-ID-Hash: 47I6GWBKO5IVQLMBMIHMGYTGLX3Y7ZOK
X-MailFrom: oswald.buddenhagen@gmx.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/47I6GWBKO5IVQLMBMIHMGYTGLX3Y7ZOK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 05, 2024 at 11:20:32AM +0200, Takashi Iwai wrote:
>On Thu, 04 Apr 2024 12:00:31 +0200,
>Oswald Buddenhagen wrote:
>>
>> ---
>> This patch series needs to be applied on top of the patch titled
>> "Revert "ALSA: emu10k1: fix synthesizer sample playback position and
>> caching"".
>
>The patch set isn't cleanly applicable even after the revert patch.
>The patch 7 fails.
>
>Please rebase to the latest for-linus branch and resubmit.
>
this makes no sense; i'm getting a bit-identical patch after the rebase
(which is unsurprising, as the file in question wasn't touched in
years).

are you sure you didn't corrupt the patch somehow (it happened before,
cf. summary of c960b012ec47)? or maybe you have an unpublished
conflicting commit?

if there is an actual problem and you just named the wrong patch, then i
suspect that it's just git-am being stupid - the rebases from 6.8 and
later from your master from about a week ago went through smoothly.
