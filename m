Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6D620564E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 17:51:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E78A717A5;
	Tue, 23 Jun 2020 17:50:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E78A717A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592927483;
	bh=2duhZAqfw9GfZ6RpbWU9CgqXMaaGITBChmPqOcZ0O3g=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a2dgZ36Ym9LR2s+yJ0txD2Y7ENSq0OpeQ5wRuizoVqFjiBWfzBTPhaeUTeDbscD3Q
	 Wz59y03Zai5/4jlSCs/84CC5Daa2rsEW8OxEKEcF3tdAXIMxCpfa3D/ASBakAtOU2g
	 V1TQMeuBNwLPXpKs8Lyqlwvo4/lnOjqYhEMi31ZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 208E7F800B2;
	Tue, 23 Jun 2020 17:49:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7545F80259; Tue, 23 Jun 2020 17:49:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12D28F8010E
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 17:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12D28F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lWdWjWRC"
Received: by mail-il1-x12c.google.com with SMTP id c75so19777652ila.8
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 08:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=inRVNfMQZm5RZmLWx/B49Pv3Ur20YwsRVqwARUqACgc=;
 b=lWdWjWRCvK7lrip/Df3aarIH/eV9kHUy29XIHf3eWdplywB98L/mJyO6llmgaFaQMq
 18hVxAlVWSdLjYgxm8K/b6apXBBs3CMCOWbBmNP9XyoulT/bTv1wLeWEM0vc/8wOs6Kr
 YUgRvOYp6QS+X9iVkmMjdYFDqmzK4kq6/SWVi6o85x6y2L4vmFNoIOLuK8d86l+L7VJy
 l4NETRQVbqSAJdkdaCN9nG/TxXG/i2V3AxjHJ0nzDJjRBTyB7+WyjNvSgT1X+YjcKOe/
 zGcI83nMWfuWQLjcP3bqNpiMJtNjZPMiFZ9vRyCoyKGhcrxFGY5cHL1p5EuWd5OAERVJ
 Netg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=inRVNfMQZm5RZmLWx/B49Pv3Ur20YwsRVqwARUqACgc=;
 b=hWIcHJSPh7K5by5kevX3LZeQUQRnStiVKXtjtNfO+0YrCh6+L2tnmTTkST3EDvdKIi
 +P0kJaMKfLwT39QiSlx//AZuuC0V4hcqak7nG1KmdQmAPn7GMk5F0HKXUeEBhu0PBx10
 EEhP/DvPntXbUT8O3QxQD1PgwoP5Ng2DSEmyFO59X6AscW0EeZnmdTpTa2ByKbR3lD4b
 3AvIqcjmm1zKw6dGXWkYoGYabMgSD3t4gVWdUNfB0V1WT3iaGMqpbE1gT4iG7mdsn728
 M/kh/cHXtQVOydLxT7A/vDGi3bfW1xmqYX8JucH7HZDZ6UpY3fXyJIpm1GpSohXAt2Nf
 bdaA==
X-Gm-Message-State: AOAM530OThSSzTLHZ9QvjAD9zbnXaLQSHylDbNyPHXqloNC/Z7bm18VO
 PGBxus8YF7dVmMU1yAsx0NpiBoaJbjBvGyGdTm38Fg==
X-Google-Smtp-Source: ABdhPJzLwXiBWYTrklydRO3wiAldF1ncPn8nf27NU/Y9UEgf6B1g3wr7mkdwpNVYBXqADANF3AeUSElG6rvQfGULsTo=
X-Received: by 2002:a92:d308:: with SMTP id x8mr13348195ila.3.1592927369937;
 Tue, 23 Jun 2020 08:49:29 -0700 (PDT)
MIME-Version: 1.0
From: Stanislav Kazmin <stas.kazmin@gmail.com>
Date: Tue, 23 Jun 2020 17:49:18 +0200
Message-ID: <CA+-1zuv3SeumhdMbqXjZU0tbmh7HB9LwTK2bfNTe5nOCmz4BgA@mail.gmail.com>
Subject: [HDAudio][ALC295] speakers not working on Acer Travelmate P614
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hello, I have the following problem on my Acer TravelMate P614-51T-G2:

I have all the audio sinks correctly identified (like HDMI, DMic,
Headphones)
but the internal speakers do not produce any sound.

What I have tried so far:

- hard/soft shutdown on Windows and reboot
- disable/re-enable speakers and microphone in BIOS
- uninstall pulseaudio and test alsa alone (so it is defeitely **not** a
pulseaudio issue)
- switch from sof-hda-dsp to snd-hda-intel driver (without Dmic support)
- retask pins 0x14, 0x16, 0x1b to "Internal Speakers" through hdajackretask
(only basic, without advanced features)
- removed/reconnected the headphones

`alsamixer` shows all needed sinks and nothing is muted.

I already discussed the issue at sof github
https://github.com/thesofproject/
sof/issues/3058 but since the same issue occurs on `snd-hda-intel` legacy
river, I was advised to communicate with alsa-devel team.

The alsa-info.sh result are linked at http://alsa-project.org/db/?
f=252f92c7a1df3c755d16ee69353b26d2535a4d81

I have tested the kernel 5.8-rc1 but it does not make any difference.

Let me know if I can do anything else to test the issue.
