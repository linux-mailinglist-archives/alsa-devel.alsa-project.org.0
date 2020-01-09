Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1052138E53
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jan 2020 10:57:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4944D1668;
	Mon, 13 Jan 2020 10:56:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4944D1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578909442;
	bh=jeztxniX10kRqtjCyFRTiyzvGxzBMAMZgbk/x6NSfPo=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oj+PwCZuAjVuLt2oDEua2fkUGUJ92i6rHlzLKqZGeHr5IT+NiLDSWfRWiTac7Wac0
	 dxsX+fMBPjcVFbpNaNCYLKp22v2YldgEJasPjGtbHRFy1Z9pgN5Tkpd7dEz6H8zLs5
	 JOdF7z4tWQfwgdxqFwwo6DDynYpVhUsY1zsn35A0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ADA9F8026F;
	Mon, 13 Jan 2020 10:54:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACF93F8014E; Thu,  9 Jan 2020 23:10:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B720CF80101
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 23:10:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B720CF80101
Received: from localhost ([130.83.5.183]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis) id
 1MF3Y8-1iwGeZ1mUy-00FQIx for <alsa-devel@alsa-project.org>; Thu, 09 Jan 2020
 23:10:35 +0100
Date: Thu, 9 Jan 2020 23:10:32 +0100
From: Tim Schumacher <tim@timakro.de>
To: alsa-devel@alsa-project.org
Message-ID: <20200109221032.GA74081@impa>
MIME-Version: 1.0
Content-Disposition: inline
X-Provags-ID: V03:K1:I/mnSNpjg/ItN2+IFmGFHJNhHPfLxjlVLXs+hqO0kDPIkcfmroO
 LxkK4CL0Ynkds22mo4tOcMQjYuhUlOPihPC5fWoOb4qCGLiS2gjp3Re2TYy5LjC9d7/3P1N
 UdY75YmFtKIZd6c6LdlRFc4rp+7fO1BpblSoTR9Sr3xRWa1cE/HirdOESgdusXU00lnPHUj
 TZ6T0ByFKgbhZT3CSulDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1r6Yd0MmA5U=:AuQWLvAAqYvT7+jx/cBiZz
 AeaQtDHQDTU/H6Ajo3IAlq58GvQkcmveYOrTihGyqruhpXpW+szRa0c8qmahrQxaa+Sw9xdYY
 2rN+b9Rhmtub+tj3MY6vdu0D5KbfDZ8hcDxWo2aPlb/8Xt9+fQo26q65z3SnZ28YVTLLQ9BfS
 5qwUmgrRCC7T65bhqygWVbJmA95N2wnW+SqqSE7tQuqQMqfqwXhtpf9T7JVhvU65yLEQ2awfY
 oNLA8z2x9wetPeYpf9lX2nnUyh/Ne3sQ/OVGIpVk5+/hW4XI5l8cenHB2aEIgLyuR87D1ZfPi
 1VGpCj6Whw3C7w3TeKkhKeKBccDf6GjgBjpn1K6CU3LixCvqqMfzM/sFf2XvFWp852uXS1Yqj
 jB6d+0dsO+C9AvJgKMtKYNPZATgY43ImewHn0JDNBF4bbczaYXYnX2vIw6i4/Domls18H61Ii
 G+l++Yt/4RHLZNCQXyAVP9A7eeRpFX4WTlJjSd2KgMnGJAnE+g4dRzUXxUa7V1KYF0eT1ZSkw
 CGYNCXEHZLWhb/lmkAMxPTW913X8YowK2GxS/1a31RRM5YgtsR6FbNPv4ox1HivHYhec52ikA
 PeXVaCsWC9N/YP+j8gG3++h/HtEiOzeugcZWLJa1vEgp4uAMiK53SsZPxIJOMiuRvUMNg/JKh
 eFVqu1yAT87dVLuZ6Gq64UlYQ1b7L3eFtk3+FiiNje7Lk4fvcljeZ6Z5OuZFOFIn27VVRqsfu
 OCR23TKR/+MPs1FLukJpj+R/q4KrjNgDqe6Y+D1UGslWT69ks4VJRnH+2iI/gWYYjznV6cldc
 XcL2/bYfQD0NnKRnmWNeONngx3+l7iHKHWmX+8GRbgLmVC4aGqtprWmCwJR8pbzqNRj4M89+V
 uj23vKXqaV5/ZmLzoWjQ==
X-Mailman-Approved-At: Mon, 13 Jan 2020 10:54:48 +0100
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
