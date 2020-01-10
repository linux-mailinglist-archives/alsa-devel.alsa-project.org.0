Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B7A136B0A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 11:27:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3951171A;
	Fri, 10 Jan 2020 11:27:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3951171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578652075;
	bh=jeztxniX10kRqtjCyFRTiyzvGxzBMAMZgbk/x6NSfPo=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tkCOfdTucp1Eiz4HUNcrhk5vSqDh6Bm0sWTo6FmPZ1ed/whn4Eix+GuirZXCRH2dG
	 VD6CPFZrrZPNpFZuVI0xluQEmOYJBjLnN+gxm2Kai40IXxUFLYPaUMTwKKsxn/ay20
	 VnpPlAEFGk0PGlz1SCT5QlZw58p1enypeEnHaRCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81DCAF8011C;
	Fri, 10 Jan 2020 11:26:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53CE1F8011C; Fri, 10 Jan 2020 11:26:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65938F8010B
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 11:26:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65938F8010B
Received: from localhost ([130.83.5.183]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis) id
 1MLA6m-1j7wbf16HK-00IAuH for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020
 11:26:05 +0100
Date: Fri, 10 Jan 2020 11:25:43 +0100
From: Tim Schumacher <tim@timakro.de>
To: alsa-devel@alsa-project.org
Message-ID: <20200110102543.GA1689@impa>
MIME-Version: 1.0
Content-Disposition: inline
X-Provags-ID: V03:K1:DYZjiD85a3Cw2kdMgkAUWJUhJHhISuLV09DVmCTTZHgFtpzL64s
 BGHFevKsjTB2GYbQCQCvDZGfJI/hYtkwFKXT1Aaq4J8EvoP4+li5y5QgU+jtlEDUhuIuzq3
 tP3aZ2YUiF1j5aS0Ci8FfwM4ZY4ha4/8fQ3pnTxtffus+rIU01VdZbJo15cgCFePVP5L3xZ
 8Z5yNxcnqMKKFNACVB86w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3Jwx8DhZ6c4=:Vd73DDi0vwRoQGl++IWml5
 zJRdFzNk8OhsdRKxMYRUfqDxjCZXAfviVvoMydAKRcgPLzQMCFqnHEgPPH2VbG5ozlBPaEs84
 9ZSY5/t1gx3KBJvZWLgkvZC2z2yN0gdTMwgBOBs6oReIWRleT7al0q/z7i0yZWbZQKKsRY5OE
 Q04X5trpfOnu5yshD6EwjCITTjSQHOIH+nx8gxmQcOaazVwcVF9aUxpOFHZtsnQQ7xncTmHf5
 eOH92dbHJCxEPo/b+cY85wNrWPUDjnytjK+2h4sZ/x4r/VMvxxyXHGcQmLXaOLyK/dMxXYk6M
 TnoXketw7ShS6XAentEMdoJieeP4wl7h06tzoHKc0gIM0PJSMlny0CTogG/HR11nUzzYfu47m
 riaooXK++hRgUKqqGF+EpRO3/drOiFzLiNmP0mNGxz3p8TjWPrY8DSxhnjRAjd9PqF3CrGj3w
 vBoP9SauvwjHQzvJdPBdA2Fq7PVUYSbTor9NEEhAa416JxZxFAqFOeTumzSJre7OnuT1+jaty
 G6PjBhVPjqHdcxc0CcQnXjJbqfXW/9r7gDLIX/+NPKjOjPNR6w1yHVg6DvUDfzVNE9+Q5Ryb9
 GJxyQ8GyB4ZSGgiOerkUfamAnXdIB83RiRB4QR6K4NOa2ZjmVYVlqnDZVFJOLRLT4pBlDP32x
 XBOKT+7w1jQrVu7t0diHKw6+HCm+5s0KgyVg1Be7hitq/IslML6wXpAQC+gDu1cJ6lzqEISx7
 u92eEbQFv2IKCMia7xhgiJ2szDOIfqspoNkyoc6IXoITiiL/lzL0oENX4lbq7kWTSa+h2XbRI
 kiG5VyJYAv0s1igFQiYpPmdN8Xsr/TjxX2JVDcK1VkQzeiBY9xg6TWhtAdRhzSwCvNaSJVRKo
 dmRmfZTPsf9QB07Wc9fA==
Subject: [alsa-devel] Bug report for changes in ucm2 with chtrt5645 card on
	Lenovo Miix 320
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi alsa devs,

I'm on Arch Linux on a rather uncommon laptop (Lenovo Miix 320) and my sound
stopped working on the upgrade from alsa-lib 1.1.9 to 1.2.1. wabbits on
IRC helped me track down the problem to a change in the
/usr/share/alsa/ucm (now /usr/share/alsa/ucm2) files. It seems like
/usr/share/alsa/ucm2/chtrt5645/HiFi-dmic2.conf and a symlink at
/usr/share/alsa/ucm2/chtrt5645/LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf
were specifically added for this laptop but in the contrary they break the
sound for me.

After the upgrade to alsa-lib 1.2.1 the sound is not working. The commands play no sound:

    pasuspender -- speaker-test --nloops=1 --channels=2 --test=wav --device=hw:0,0
    pasuspender -- speaker-test --nloops=1 --channels=2 --test=wav --device=hw:0,1

And this is the alsa-info.sh output http://alsa-project.org/db/?f=f883910a5c5101b4b1ea4202d1fe84ccd139f796

After deleting the /usr/share/alsa/ucm2/chtrt5645/LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf
symlink both commands from above play sound and this is the alsa-info.sh
output http://alsa-project.org/db/?f=e759eb9118a191b6c3b8c021fed58abc9cf95076

Thanks.

- Tim
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
