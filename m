Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 215931BD40F
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 07:37:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B685168C;
	Wed, 29 Apr 2020 07:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B685168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588138667;
	bh=Dty+dfvFjiM56TcKPoX1IczO3PEPl7VY7rGav88Mgq4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s2YNBsygUIXA2r2fsBlpTaOOBocuXKxBL3bMi0aZnOLsqDQS08tlB8058wJWt5wd+
	 gP8rDopqQDa4E7fxGRjsTRhtnIulmBn3VtGa7cLY/VceuRXNh4Aw959spGVqgsHo6k
	 VTFcFiVhS+XSaEK0nkMJBaC1QuZPtfdLgGIIG67Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5D64F80217;
	Wed, 29 Apr 2020 07:36:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EA3FF8022B; Wed, 29 Apr 2020 07:36:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,MIME_HTML_ONLY,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.gmx.com (mout.gmx.com [74.208.4.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0BAEF80109
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 07:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0BAEF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mail.com header.i=@mail.com
 header.b="cykbz0aH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
 s=dbd5af2cbaf7; t=1588138539;
 bh=O8CRrvrzasQ/Y1D2P6XYsfQYwS+j9z7W8nzqP9gscjM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cykbz0aHwy09HIuTft/8qWSSuHwCUAt1gYmNpfl0oS1gVIm6nEgLvKip08pkT2DLN
 0epcY/88mxj56Cvq+vAvZVR1CwHGwZ6mLUzUr8mC1pGIhICRIdKZWKT2MffaBnCmnl
 tCsVV3ows1kuBJW6oue76rL16q+XTLN6NRvaMzpM=
X-UI-Sender-Class: 214d933f-fd2f-45c7-a636-f5d79ae31a79
Received: from [125.236.144.10] ([125.236.144.10]) by web-mail.mail.com
 (3c-app-mailcom-lxa07.server.lan [10.76.45.8]) (via HTTP); Wed, 29 Apr 2020
 07:35:39 +0200
Message-ID: <trinity-e21ed2f9-efc6-4950-b2e8-432d8622e570-1588138539644@3c-app-mailcom-lxa07>
From: "robert rozee" <rozee@mail.com>
To: "Kai Vehmanen" <kai.vehmanen@linux.intel.com>
Subject: Re: underrun problems after setting parameters with
 snd_pcm_set_params()
Date: Wed, 29 Apr 2020 07:35:39 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <alpine.DEB.2.21.2004281842250.2957@eliteleevi.tm.intel.com>
References: <trinity-86378cc8-0b7e-4b09-ae35-8342d01fae5c-1588059797517@3c-app-mailcom-lxa01>
 <alpine.DEB.2.21.2004281842250.2957@eliteleevi.tm.intel.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:VEVhQg6silU6WE355rbGklEZPX5GO+vpd9iquIp4y7x5iZ5wf1L8wqt+YlkHuFEpCMH4m
 UXul+9aelt+N9hIiKfo1Eo+LW/yI7gx/ZLXvjFPc9xStdLmdW2iGZat8VS6r/9gxW0MUTQmTBuhq
 l+TPpQ6Zw1hUzmQImOE4bs80cDA2ymjBtExEZwncC9jCRweVwOh1kaR7PsXXDV4etTsAbS13Yc92
 ExRzAAMUntaLkeeNbet/YklpNYKqpMs5pqwp+xOqxhD2TTx33pgimOXUCFgzhWxQP/sZXkNT1I4O
 qw=
X-UI-Out-Filterresults: notjunk:1;V03:K0:fN4ga6iX/94=:xCgW6Ll6ivrJ1wJS39nt2O
 asfev/yIfFWia72w+CGJw4NSnfjM89hF/H/xQSQYk/HJmQVkBdRfhLGpv3UtD9eN+Kx5bwAIy
 znN084IQarlSePjh5VoQK2y7wEwLKTNcQvT0KT28i9QXtkyLzrZ9kgGJvKkJs4Sx2LFTJpKez
 2tyLk3M2wcpuQZybzOgrpHZKW6SN43ClL4wOyL+ihBmdiILhl/CHaFLjtXcFXXUlgiXBTt3LS
 jHADwevz6QxaXDiF4pWpg0bMWBxYo9rdoM5pj51o8EXqFxcKBVVSsQ6Y7nqF40QoXkD9KvIuo
 VQ/CJg06Dnu+wPit4DsRQRwjaGY1vREIhdd0vcKH3Zq201KFVhO7w+C1OblhKMsed+XUzrvBZ
 YsLDLcem97frSCtqP+FOUtlj72RsKpBSI9B3/MDwTHdb5P49Wr0DKNvAUE3dulme8t7oOQTWI
 yUXEj8GQU3Dt7aRlymMXmj57FlY64wTiT82l7uicUZVYOfjLhkgHcaaKRTxADa0psWaNr6ooS
 WTr+346YWgbVmAwEbsW0e1AStYVumyYxdIz716nAjfYlmUWWDvKyyp297KJvO4gyigfmMtdVQ
 GNikpfDG357ADv7BED5FxfDQ8uRTZWPIoJrTfyDSbb3yDztq2C9Iqr8DkgeI0Wl7Qijyov4Aa
 ta7NnewpqJ9CUyPLWG3mhhDtvo5COCa2QOswGXCMj5YYBd+aizML3cE6bkF4xDDxyXe8=
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

   hi Kai,
       well, that's embarrassing! the problem was indeed largely with the
   latency setting.

   the min(500000, sample_length) was to allow for samples of as short as
   50ms.
   i had found that short clips they were not playing at all - but that
   was before i added in
   snd_pcm_drain(handle).

   with latency fixed at 500000 and snd_pcm_drain(handle) at the end,
   everything
   now seems to be working perfectly!

   much appreciate your help   :-)


   cheers,
   rob   :-)


   robert rozee
   p.o. box 25-232
   christchurch, new zealand
   phone: +64 21 123-2603
   email: rozee@mail.com


   Sent: Wednesday, April 29, 2020 at 3:52 AM
   From: "Kai Vehmanen" <kai.vehmanen@linux.intel.com>
   To: "robert rozee" <rozee@mail.com>
   Cc: alsa-devel@alsa-project.org
   Subject: Re: underrun problems after setting parameters with
   snd_pcm_set_params()
   Hey,
   On Tue, 28 Apr 2020, robert rozee wrote:
   > the problem only occurs with SHORT sound clips. i found that clips
   longer than
   > 1111ms played without flaw. clips less that 500ms generally failed to
   play to
   > the end, but there was no error code returned.
   in general, given you have sources available to all the popular apps,
   it's
   good to check how other apps use the API. I.e. aplay.c may be useful
   simple additional reference for you to see how to use the interfaces.
   I think you are missing draining the samples at the end, and then
   your latency is setting is incorrect. I.e.
   > snd_pcm_set_params(handle, SND_PCM_FORMAT_U8,
   > SND_PCM_ACCESS_RW_INTERLEAVED,
   > 1, // number of channels
   > 48000, // bitrate (bps)
   > 1, // resampling on/off
   > min(500000, sample_length)); // latency
   That sample_length does not look, the unit is usecs here. Please try
   just putting latency of 500000 (i.e. 0.5sec).
   > // send out current buffer content
   >   frames=snd_pcm_writei(handle, @buffer, frames_to_write_now);
   >   if frames<0 then frames=snd_pcm_recover(handle, frames, 0);
   >   if frames<0 then break;
   > }
   When you have finished writing the audio samples to the ALSA device,
   you
   need to wait until ALSA has a chance to play all samples out. If you
   look
   at playback_go() in aplay.c, you'll see:
   snd_pcm_nonblock(handle, 0);
   snd_pcm_drain(handle);
   snd_pcm_nonblock(handle, nonblock);
   ... at the end.
   Br, Kai
