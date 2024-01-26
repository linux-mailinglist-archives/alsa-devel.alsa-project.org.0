Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8C483D4CA
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 09:42:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBA501FF;
	Fri, 26 Jan 2024 09:41:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBA501FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706258520;
	bh=4Ba+AXv6cjOA09EXCynm2OfDDpX7FV2pNyYQ0MKi5j0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=E5Jm6YIsEloyciNr5tbOq2wQ3acT34asxR2psijABkFNJDEHhWRDg4GmTb2Va/65L
	 uclbFmecIMSi0tDgbwm0vThl6xE724a+rhbp17ldlHJTqn9sZi1xCqdOOVM33BTQnh
	 lEcvcgiuSKfjFU1Ry+1uvz4kpDvHYqbirNYU+wQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D581F8057C; Fri, 26 Jan 2024 09:41:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78F87F8057D;
	Fri, 26 Jan 2024 09:41:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3677F8028D; Fri, 26 Jan 2024 09:41:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ED7CF800C1
	for <alsa-devel@alsa-project.org>; Fri, 26 Jan 2024 09:41:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ED7CF800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1706258471456406832-webhooks-bot@alsa-project.org>
References: <1706258471456406832-webhooks-bot@alsa-project.org>
Subject: Hi All
Message-Id: <20240126084120.D3677F8028D@alsa1.perex.cz>
Date: Fri, 26 Jan 2024 09:41:20 +0100 (CET)
Message-ID-Hash: ZPF2UTVJQ4RMJHAJS2UE2VBRKMOB7HYE
X-Message-ID-Hash: ZPF2UTVJQ4RMJHAJS2UE2VBRKMOB7HYE
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPF2UTVJQ4RMJHAJS2UE2VBRKMOB7HYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #380 was opened from kingjoma:

Hi All

I am a linux noob. After purchasing a SteamDeck and in an attempt to achieve outcomes from first principles I am trying to get MUNT to work with Dosbox 0.74-3 from the flathub repo (??). I successfully grabbed the DosBox flatpak from the Discover Store and successfully downloaded, compiled and installed MUNT using terminal commands. I know that there are Dosbox versions with built in MT-32 support, which I have installed (eg. Dosbox Staging) but in order to understand Linux a bit better am challenging myself to code from first principles. After running the mt32emu-qt command from the terminal and then running:
`aconnect -o`
I am expecting to see 
`client 128: 'Munt MT-32' [type=user]
0 'Standard'`
The issue is the line regarding client 128 is blank. MUNT launches, I have the ROMs installed and have tested midi files through MUNT and get sound, but when trying to point
`midiconfig=128:0`
in the dosbox config file, it is not working.
Here are the steps I took to install MUNT, there were dependencies I needed to install and initialise features on SteamOS that are normally not used in vanilla SteamOS builds:
`sudo steamos-readonly disable`
`sudo pacman-key --init`
`sudo pacman-key --populate archlinux`
`sudo pacman-key --populate holo`
`sudo pacman -Syu`
`sudo pacman -S qt5-multimedia`
`sudo pacman -S qt6-multimedia`
`git clone http://www.github.com/munt/munt`
`sudo pacman -S install build-essential`
`sudo pacman -S libgl`
`cmake -DCMAKE_BUILD_TYPE:STRING=Release`
`make`
`sudo make install`
`mt32emu-qt`
I then added the '/usr/local/lib' path to /etc/ld.so.conf.d to ensure MUNT picked up the local library and then ran
`sudo ldconfig`
Please assist in trying to understand why the MUNT client is not showing up? 
Thanks

_Originally posted by @kingjoma in https://github.com/munt/munt/issues/116_

Please can I ask you to review this issue posted on the Munt Repo to see if you can advise on how to resolve the issue. The progress on troubleshooting is indicated by the discussion on the Munt issue channel. 

Thanks.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/380
Repository URL: https://github.com/alsa-project/alsa-lib
