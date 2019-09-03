Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 007C8A7496
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 22:26:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FF731676;
	Tue,  3 Sep 2019 22:25:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FF731676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567542381;
	bh=d4XTJx04lZSFiRcrHPdoiN22qzww0IFmSsKr+z+z8Dg=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oyZFSuBrm6pbqKxB+UV6zyrjt33YXF7vXfTdASrWE1hO/vIcQTGEnuoO6eTdfx75c
	 ZngG53rhHeCkGn6dhd9JyXxFg0y2La2nxpK2R7ZvZ6/vrhmilnYBhEWbN6kJQHwg7m
	 fpWUgWifLOG8GdTQctnuQWu0Ud+yMXOd31BoGtdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED453F8045F;
	Tue,  3 Sep 2019 22:24:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95518F8045F; Tue,  3 Sep 2019 22:24:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92D65F80392
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 22:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92D65F80392
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="trHGRjIA"
Received: by mail-qk1-x733.google.com with SMTP id 4so17364981qki.6
 for <alsa-devel@alsa-project.org>; Tue, 03 Sep 2019 13:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2gekvq1SXbVSEiTi70hmLGE4syNt3vNmC0qaCHg3k8M=;
 b=trHGRjIAzLnFZKSyeSTdPzuqgA/a9zM5hFp5cgWCH7vTFPUrOGAIRUfXkuRB1t6Q+0
 jQu5l7GqU3EnOs1VLYX+ko2IAEjnrThaNCxV8WZEVW3yqRHdbQQtOfZb39ft/QvGpZCi
 kx6OYZDQ6GzjTz2zFZh9tRQ2p+Vuxg4y6qTl4t7EPAs5quVLXYtaore+mBP/6bWnOup9
 4+S0i43CvWnXWeBusCvZiAW4S6EGZ2wUyS8K6BUUh5ov0Ksxh+PAIoYzezCXL7VNyxzt
 iNdMdV5tIFH/3g/38P1Qc5wmz11b5TcUGQfBLq7whqn+zfFPKFAr+5qxTsGzDNhSst7u
 zQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2gekvq1SXbVSEiTi70hmLGE4syNt3vNmC0qaCHg3k8M=;
 b=DnG3hlgFISMAYf02dxZc+OMs1N3WVdvWBmpBjvoz714zpW+ZHPAzEUsHRtEtYVw85f
 qDtPwUCsK12DeywgiPUu/UkQw1oN6ttVVS8M7zx+oDGdomyRVVwTXO9mg3ihTroBRBWC
 e485LUDfSTX+HtHjokJQak36aJzQJMqCQ1e5a8hChLyAhjFdjJ0DagUhzT0mLhsirq+E
 ka0AAmZn+xu9Wjrxs0UVtr4kNcEgbyGcUiNObNjhKvNFv2FaHJAz9ioMSrt2tZztqsjc
 n0Heue2XaeanoEA/CrKOiixIirdJgpJBlhQsiuOhw4VCDoY3RVAtMHjtIeoWTIK+RB7w
 qVsQ==
X-Gm-Message-State: APjAAAWLlQfD3xJMbiXIg3k6Gkrm3hq+u+fMZt99TquXZSJCfhnScWR8
 mrRkTCd23u7IsGzahRfKhhZNoLP77Vb8ZhGHLepWJwo4
X-Google-Smtp-Source: APXvYqyZ9HxiQpq0bnYrRTFr2FKWCDeYVfwsypkjuewHwZUz5KTwRORNkFNq02d+pHW1PrRNnJw7ktsArOLtL9EY04s=
X-Received: by 2002:a37:6250:: with SMTP id w77mr20847119qkb.153.1567542268996; 
 Tue, 03 Sep 2019 13:24:28 -0700 (PDT)
MIME-Version: 1.0
From: Nathan Royce <nroycea+alsa-project@gmail.com>
Date: Tue, 3 Sep 2019 15:24:37 -0500
Message-ID: <CALaQ_hpzEEWbYvFxjpKqMfeFkSnKL7oXx8vFncibb-YkZfxJGg@mail.gmail.com>
To: alsa-devel@alsa-project.org
Content-Type: multipart/mixed; boundary="0000000000001d4fbf0591abe0bf"
Subject: [alsa-devel] snd_usb_audio - ALSA woke us up to write...was
	actually nothing to write
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

--0000000000001d4fbf0591abe0bf
Content-Type: text/plain; charset="UTF-8"

*****
...
Sep 03 14:32:58 username kernel: perf: interrupt took too long (4174 >
4156), lowering kernel.perf_event_max_sample_rate to 47700
Sep 03 14:33:03 username plasmashell[1057]: qml: temp unit: 0
Sep 03 14:33:14 username org_kde_powerdevil[1089]: powerdevil:
Releasing inhibition with cookie  14
Sep 03 14:33:14 username org_kde_powerdevil[1089]: powerdevil:
Releasing inhibition with cookie  15
Sep 03 14:33:14 username org_kde_powerdevil[1089]: powerdevil:
Restoring DPMS features after inhibition release
Sep 03 14:33:14 username org_kde_powerdevil[1089]: powerdevil: Can't contact ck
Sep 03 14:33:14 username org_kde_powerdevil[1089]: powerdevil:
Releasing inhibition with cookie  16
Sep 03 14:33:14 username org_kde_powerdevil[1089]: powerdevil: Can't contact ck
Sep 03 14:33:15 username plasmashell[1057]: qml: temp unit: 0
...
Sep 03 14:33:23 username pulseaudio[1081]: E: [alsa-sink-USB Audio]
alsa-sink.c: ALSA woke us up to write new data to the device, but
there was actually nothing to write.
Sep 03 14:33:23 username pulseaudio[1081]: E: [alsa-sink-USB Audio]
alsa-sink.c: Most likely this is a bug in the ALSA driver
'snd_usb_audio'. Please report this issue to the ALSA developers.
Sep 03 14:33:23 username pulseaudio[1081]: E: [alsa-sink-USB Audio]
alsa-sink.c: We were woken up with POLLOUT set -- however a subsequent
snd_pcm_avail() returned 0 or another value < min_avail.
Sep 03 14:33:24 username plasmashell[1057]: qml: temp unit: 0
...
*****
During this time period, I do believe I was starting an android
emulator and also watching a twitter video that had audio.

--0000000000001d4fbf0591abe0bf
Content-Type: application/gzip; name="alsa-info.txt.RiEO98Coqb.tar.gz"
Content-Disposition: attachment; filename="alsa-info.txt.RiEO98Coqb.tar.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_k04a6uya0>
X-Attachment-Id: f_k04a6uya0

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
TDDBBOeA/wOI7fOqABgBAA==
--0000000000001d4fbf0591abe0bf
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--0000000000001d4fbf0591abe0bf--
