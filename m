Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C7B53C8DA
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 12:38:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4125185B;
	Fri,  3 Jun 2022 12:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4125185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654252737;
	bh=MZgSgkuelUB2bqT/hGN4RaKV75AS5O65rBH5WsbZeS4=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vNv0X4t+wK+Dpx5AkA9NzSaehaYQ34pdU7PJtwVvWFZghW3Eb5vc3e+1dIZq4fLd+
	 eX0Gm8hi/8X3vpj3manMp8KPFliVRUPbb3PMRSqgH/E/aIsRtjBmWx37O8snaM6ha7
	 JBTsLRfuInlu/t42qHebflTlrCfC75ibFes1/EM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E960FF8052E;
	Fri,  3 Jun 2022 12:37:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58AAEF80236; Fri,  3 Jun 2022 01:28:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 173DDF80149
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 01:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 173DDF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=vt-edu.20210112.gappssmtp.com
 header.i=@vt-edu.20210112.gappssmtp.com header.b="fCDSs9YZ"
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-f2bb84f9edso8697938fac.10
 for <alsa-devel@alsa-project.org>; Thu, 02 Jun 2022 16:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vt-edu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=MZgSgkuelUB2bqT/hGN4RaKV75AS5O65rBH5WsbZeS4=;
 b=fCDSs9YZjsjqNXhiYIHRYmpuqtwd+WOcehGhCisZnJMdn9kp2KMbRVntq4LybMZuhA
 7YZP4487mM6KkGBqtX9QhTX7HC4bX+D1iUCFGjMy3NnDi8hPSINPkEIjciQaIbgobE+t
 wSSNHbLS5DWTiVnX2OXKmpCdjGm6kv4GKWfSvRLa9vNm9JG45b+51OxG5dOnIPVAINpB
 YCEkiHJqfn3t5Ft0eQf1qJR4m5T9WnX2i0BNbdbdyC3Jrn1SomviHQtwjVUH/Th9/q6v
 zDQbKJ7JKX+5jVCp+iir5AFy6++SfRtZZ8HIuw+rXPwttgGnFdT0QxovhVe8Dg4BnYIu
 Za+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MZgSgkuelUB2bqT/hGN4RaKV75AS5O65rBH5WsbZeS4=;
 b=VWyyxxhzWEjMCSKvw3mXXEixg1CemIT2o0N/0YH0sDPpPGuL7c1QoOYFMnzOd+E7v9
 mHSDXu7mXWz1u/yRc/osby1hSvHfLz0vl5woj06PR4e3N/2bXx4wU8lg7JsGL9Zd1unO
 EG6ivDGrV52QH0/Niw1jgSZ10RI76G4xVUraV8gCdFQ4IHcwYzAfBWe5Pm6SDM/du/Sj
 JfAJKuXKBUWb1cT1PUrp6A8saM+GdA3vmnq8IjK52O9wbuPybjAbhzlJg1+6bfMSwDEh
 c9O7gbeil0xNd8tNFp1KqP6XQ75GLF1EBLxT9lxwYdXezHmxVusjNafw8DgSq77wY244
 rO2g==
X-Gm-Message-State: AOAM530u5Q4C1vAVyk4WB3CyWNGYZIUWHJTlLN1q3QvCtMajqKjz6V4u
 RGiifLMBNlHG0s6BIo36E5hd4tci3K8klmFlbZizG6/1LwQ=
X-Google-Smtp-Source: ABdhPJx7gB1sTLuIlBepCKuOpJi5W0y8pU8f659etm4PFpOKaZC8X0Y/VnVRdvcK28JbglJUfz/xBE03/Qd7G2M3xe8=
X-Received: by 2002:a05:6870:5628:b0:f3:26ff:2f98 with SMTP id
 m40-20020a056870562800b000f326ff2f98mr4144034oao.176.1654212529979; Thu, 02
 Jun 2022 16:28:49 -0700 (PDT)
MIME-Version: 1.0
From: Mikhail Kravchenko <mkravche@vt.edu>
Date: Thu, 2 Jun 2022 19:28:39 -0400
Message-ID: <CAL-J7+aURwwF8fVpQp36aojNFhAqcsdFaEia9EAAbOagVD40QA@mail.gmail.com>
Subject: Issues with ALSA after update to Pop!_OS 22.04 LTS Jaunty Pipewire
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 03 Jun 2022 12:37:02 +0200
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

I updated the operating system running on my machine to 22.04 Jaunty.
This update brings the system over to pipe-wire. After running certain
programs that utilize alsa, the audio on my system becomes
intermittent and runs only one application's audio at a time.
Resetting the pipe-wire services and forcing alsa to reload its
modules does not reliably mitigate the issue.

This is the url generated by alsa-info.
http://alsa-project.org/db/?f=4d643a3153ffabd5c72313e8ffa3c9f393e676ef

On a power cycle, the audio seems to work fine, but as soon as I run
the problematic program I get the output:

ALSA lib pcm_dmix.c:1032:(snd_pcm_dmix_open) unable to open slave

If the program's audio is successful, and it opens the slave. Audio to
other applications is upset.

sudo alsa force-reload
Unloading ALSA sound driver modules: snd-seq-dummy snd-seq-midi
snd-seq-midi-event snd-hda-codec-realtek snd-hda-codec-generic
snd-hda-codec-hdmi snd-hda-intel snd-intel-dspcfg snd-intel-sdw-acpi
snd-hda-codec snd-hda-core snd-hrtimer snd-usb-audio snd-usbmidi-lib
snd-hwdep snd-rawmidi snd-seq snd-pcm snd-seq-device snd-timer
(failed: modules still loaded: snd-hda-codec-realtek
snd-hda-codec-generic snd-hda-codec-hdmi snd-hda-intel
snd-intel-dspcfg snd-intel-sdw-acpi snd-hda-codec snd-hda-core
snd-hrtimer snd-usb-audio snd-usbmidi-lib snd-hwdep snd-rawmidi
snd-seq snd-pcm snd-seq-device snd-timer).
Loading ALSA sound driver modules: snd-seq-dummy snd-seq-midi
snd-seq-midi-event snd-hda-codec-realtek snd-hda-codec-generic
snd-hda-codec-hdmi snd-hda-intel snd-intel-dspcfg snd-intel-sdw-acpi
snd-hda-codec snd-hda-core snd-hrtimer snd-usb-audio snd-usbmidi-lib
snd-hwdep snd-rawmidi snd-seq snd-pcm snd-seq-device snd-timer.

MK
