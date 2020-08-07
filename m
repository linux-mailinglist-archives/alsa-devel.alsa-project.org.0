Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D81D823EDA8
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 15:07:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 767A615F9;
	Fri,  7 Aug 2020 15:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 767A615F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596805627;
	bh=AR4ihdx1/e1aKPgsnYOkF27WUQdSky67yBlxji70x0s=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aIR3AUfrkLMCE5wF07I3b2F6CCNcZAEaMDM3eHCUyYdJwGw33U9XzEQutL4IYUCDJ
	 qGOPdfBni3gi1P+/ofDwRjI96M0XqFPq/E0hO0Z0SW/hWS+BcjiJIoqUzD44ZLASwA
	 30eAEi2KDpR2qwQlgsxnk4/sJIDe6LAWBu6tgQcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97DB9F800AB;
	Fri,  7 Aug 2020 15:05:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73A64F80218; Fri,  7 Aug 2020 15:05:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F102F800B7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 15:05:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F102F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=alarmhandy.de header.i=@alarmhandy.de
 header.b="ebYpUPQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596805513;
 s=strato-dkim-0002; d=alarmhandy.de;
 h=Date:Message-ID:Subject:From:Cc:To:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=30UCX+4Qop2pXXansa8sVLKqH+RhD+ev0heKsMD4Akw=;
 b=ebYpUPQd73Mzw8mflLNt0liKziqIBGO9066NOrdVI4FFMrGk19k+1JAIlYpDMwj4go
 JOL5hS1PpZkf3SWcHALjYgQqJip2W1IQL1NyLr6ewUKMLlA6t5qGf0OL31chxoZ74EOM
 BikZldsynOWpPFIHyLTNVnZ6d+OsJbasKkonjZFcjkhk+Wwg/XxgUd1ymxNSY26H02Q9
 4vhe4RJrQm4DVZMRmWIeAsqn5QHhp1GBzUn9CoXRILusxUwSEiiv9IMyLvnhwVGlqMqb
 Wy41ld/ooDRON8n0MNovFQclvv0W5MP+QpKCFmKccF0xIHHs2p6B+vz7IryrV5Nywth8
 YQbA==
X-RZG-AUTH: ":LWABbWCpd/7F2tYDFKK/RTiu0TNXYdF7Mwi+q4wIVIrdnF+kUmjp/0vw2qvj/uWT+YVE+CFkfD398SRT802n8iE+xuOsHvqCCvAXBA=="
X-RZG-CLASS-ID: mo00
Received: from localhost by smtp.strato.de (RZmta 46.10.5 AUTH)
 with ESMTPSA id Y0a2fbw77D5DM7L
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 7 Aug 2020 15:05:13 +0200 (CEST)
To: alsa-devel@alsa-project.org
From: Alexander Giese <alex@alarmhandy.de>
Subject: [HDAudio][ALC285] Native speaker support for HP Spectre x360 15-eb0xxx
Message-ID: <e6a982a8-15c8-1fad-e412-fa5b9d289fd2@alarmhandy.de>
Date: Fri, 7 Aug 2020 15:05:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de
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

Hello alsa-devel-team,

I have a problem with the built-in speakers on the 2020 model of the 
hp-spectre. From my unexperienced point of view, the audio sinks are 
correctly identified and therefore I tried tweaking the GPIO pins with 
success.

Information from alsa-info is here: 
http://alsa-project.org/db/?f=c8ee13e52fd6b2377573a7123c2887fe4d59c917

When I use hda-verb with the following parameters 2 of 4 of my built-in 
speakers start working:

hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x02 (or 0x04)
hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DIR 0x01
hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_MASK 0x01

In addition, my mute-mic-led on the keyboard glows when:

hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x01 (or 0x02)
hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DIR 0x04
hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_MASK 0x04

Since I do not understand how the GPIO-settings are integrated and 
applied in the upstream software for corresponding models, I would very 
much appreciate any help to get this to work out of the box in future 
releases so I do not have tweak my system all the time and others can 
benefit as well.

Any suggestions on getting all 4 speakers to work or the mute-volume-led 
to glow are very much welcome alike!

Thank you very much!

Alexander
