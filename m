Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EB550894F
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 15:26:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 028E819FF;
	Wed, 20 Apr 2022 15:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 028E819FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650461215;
	bh=Q3G8MZbnhCZ7U7nZqwaP+5HDyPc9tOB0ufaszvUGBrQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hnzfIAoVDYo7ryEJGqzxmmR4VSd77Lwh2Hh+ErHk5dI+zijwHHG9Ykid0O4Hx5eF/
	 PchuY/M2xk7eAigt45Q2q4CxuRFsN4ybKqQFsuRbIBsx14Tvtv+6BoDz+7zg6rGGeo
	 4ulckSPTQRjgfPsllhiVzRVanvD6g8J5Vu1rpjI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70F2FF80128;
	Wed, 20 Apr 2022 15:25:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9501DF80125; Wed, 20 Apr 2022 15:25:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69498F800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 15:25:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69498F800C1
Received: (Authenticated sender: lumis@xulepth.fr)
 by mail.gandi.net (Postfix) with ESMTPSA id 5D824240012
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 13:25:44 +0000 (UTC)
From: "Simon Larcher" <lumis@xulepth.fr>
To: alsa-devel@alsa-project.org
User-Agent: SOGoMail 5.5.0
MIME-Version: 1.0
Date: Wed, 20 Apr 2022 15:25:44 +0200
Subject: =?utf-8?q?Proposal=3A?= MIDI instead of input device for Caiaq devices
Message-ID: <612e-62600a00-645-76afc200@261763543>
X-Forward: 127.0.0.1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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


Hi,

I'd like to suggest changing the snd-usb-caiaq driver module to send MI=
DI messages instead of emulating an input device. This proposal more pr=
ecisely refers to the Native Instruments Rig Kontrol 3 which I personal=
ly own. It's a 2in/2out USB sound card in a pedalboard housing with 8 f=
ootswitches and an expression pedal.

To me it makes more sense to use MIDI as the device is built for that p=
urpose. The configuration software provided by the manufacturer obvious=
ly doesn't work on Linux; but what it does is mapping the physical swit=
ches to MIDI messages.
On linux, as is the device emulates an input device that sends 1-9 keys=
trokes for the footswitches and reports a 3 axis joystick for the onboa=
rd pedal + the 2 external pedal inputs.
The onboard leds and 4 digits 7-segments display are available as contr=
ols (as listed by eg. amixer -c0 controls), this could also be changed =
to using MIDI as well.

I am hoping for this to be approved and am open to suggestions regardin=
g the implementation details.
More specifically if it makes more sense to use Note On/Off messages or=
 Controller Change messages, as well as the naming for the rawmidi inpu=
ts. The device will have two pairs of MIDI ports, one for the external =
I/O MIDI connectors and one for the "virtual" input reporting the butto=
n presses.

I have already started working on it and I have a very rough POC of thi=
s proposal, adding an extra MIDI device and sending a CC message when t=
he switches are pressed. It is available here: https://framagit.org/Sim=
on-L/snd-usb-caiaq
This has been discussed on #lad @ Libera.chat, I am registered as Fergu=
sL there.

Thanks!

SL
