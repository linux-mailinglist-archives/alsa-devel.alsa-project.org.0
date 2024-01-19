Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7356832885
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 12:12:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED8FD822;
	Fri, 19 Jan 2024 12:12:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED8FD822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705662770;
	bh=rUJw8CQ9UdeEM+EGBdevLvTdmgUMyljBLPzXUydsUQ0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=f0VBlXSimR7XfpVm3e20Nn9THKgqwHA0yTVjyZTEXqiOjvyeZbD82Q7/6Vc5K9aei
	 kO6uD7lVAYhZTNdzhsGENhbHoxs39UeZ96WroUGwKXYtMRgWAVA5WjH30Bs+og2cO0
	 xqKxKqeI3IiJKLSw0Lxl+aQMaypIz0f5H/se4Pnk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A42D9F80588; Fri, 19 Jan 2024 12:12:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0109DF80236;
	Fri, 19 Jan 2024 12:12:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E878F801F5; Fri, 19 Jan 2024 12:12:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CC4BF800C1
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 12:11:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CC4BF800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1705662707893251896-webhooks-bot@alsa-project.org>
References: <1705662707893251896-webhooks-bot@alsa-project.org>
Subject: Dmic mute button is not working with SOF based acp-dmic solution
Message-Id: <20240119111202.8E878F801F5@alsa1.perex.cz>
Date: Fri, 19 Jan 2024 12:12:02 +0100 (CET)
Message-ID-Hash: KPXP5JEU76BOS5NBAX2VZN5N7WHL7I7G
X-Message-ID-Hash: KPXP5JEU76BOS5NBAX2VZN5N7WHL7I7G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KPXP5JEU76BOS5NBAX2VZN5N7WHL7I7G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #385 was opened from Venkata-Prasad-Potturu:

Hi,
We have enabled ACP-DMIC endpoint support using SOF stack, and created mixer controls for capture switch and volume.
Trying to link Mic mute button with amixer controls in the UCM config file, but unable to invoke the enable/disable sequence  when we press mic mute button.
Please find the below ucm configuration, amixer controls and pactl list.
[pactl_list.txt](https://github.com/alsa-project/alsa-ucm-conf/files/13988218/pactl_list.txt)

Could anyone help on this.

**AMIXER CONTROLS:-**
		_**root@systemc-Mayan-RMB:/usr/share/alsa/ucm2#**_ arecord -l
		**** List of CAPTURE Hardware Devices ****
		card 1: sofrmbdsp [sof-rmb-dsp], device 6: DMIC (*) []
		  Subdevices: 0/1
		  Subdevice #0: subdevice #0
		**_root@systemc-Mayan-RMB:/usr/share/alsa/ucm2#_** **amixer -c 1 contents**
		numid=2,iface=MIXER,name='PGA4.0 4 Master Capture Switch'
		  ; type=BOOLEAN,access=rw------,values=2
		  : values=on,on
		numid=1,iface=MIXER,name='PGA4.0 4 Master Capture Volume'
		  ; type=INTEGER,access=rw---R--,values=2,min=0,max=80,step=0
		  : values=44,44
		  | dBscale-min=-50.00dB,step=1.00dB,mute=1
		**_root@systemc-Mayan-RMB:/usr/share/alsa/ucm2#_**
**UCM Configuration:-**

		SectionDevice."dmic" {
				Comment "Digital Microphone"
				EnableSequence [
						exec "echo DMIC EnableSequence"
						cset "name='PGA4.0 4 Master Capture Switch' 1"
						cset "name='PGA4.0 4 Master Capture Volume' 44"
			   ]

				DisableSequence [
						exec "echo DMIC DisableSequence"
						cset "name='PGA4.0 4 Master Capture Switch' 0"
						cset "name='PGA4.0 4 Master Capture Volume' 33"
				]

				Value {
						CapturePriority 100
						CapturePCM "hw:${CardId},6"
				}
		}

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/385
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
