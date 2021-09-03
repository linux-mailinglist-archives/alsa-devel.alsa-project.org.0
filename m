Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B2A4023BE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 09:04:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C8001729;
	Tue,  7 Sep 2021 09:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C8001729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630998271;
	bh=lT/JTcz2tdYrvWI7JzAk+FVQ0XEB2/GOAPMuwh2GEGk=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oQAbQ7n1QJeP2lAnDDC7lrfZ6Guq2P1+oUWB+X/gnEBS6L+JvVpKsryZzqyyYXNdj
	 wpZDpzvrjfKXnb8pjKvNLKLlIjAisvDAmZ/XFIEUzcU/boZv+1TYiNYh1zROMUnvMb
	 1zC0DWR7azaqpwqBfCz++4XIOTf2prscxz/1Eknw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D77E2F80253;
	Tue,  7 Sep 2021 09:03:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 235B0F80254; Fri,  3 Sep 2021 18:59:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8467F800B5
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 18:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8467F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JZnq7EUH"
Received: by mail-qk1-x734.google.com with SMTP id t190so6447562qke.7
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 09:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=9sFZYLEo3TxQslh9IrS4fDGxlEpnlHS9F7rmXdcJuxI=;
 b=JZnq7EUH1b6JvcYH0yiTWGnsvQzKHLkPliMWRfCxHa/pCKMZFcaca97tQpQwEGMLJ7
 gWUaQfzheyTo12CpehNND5FM0KSa6ZcwplV/UeXpWr32H8NKLZmccS7bHCTcwpQtwXVG
 IZcym8sURSEB2rP9m7Esr+8p0mvzEPQkaauCnqCXbvQ+4ZD7D3pJd5HHu+S7nIS9FHtS
 2uZ40hHtFt7GuZGBezk7uitTkwQKoZjrC5adP+CZUQZEQEzUNfAu3aP+Ui9bo/Lz3wvW
 Cv469q+XeSTedDH0dbG6UMwe28zc6TcgPy3gGsauFcU9JfVbzv+sH+gk7vqZag0YT5jg
 Ow/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9sFZYLEo3TxQslh9IrS4fDGxlEpnlHS9F7rmXdcJuxI=;
 b=fPdCzN+ZK6fBIp8mnosAGZWQF/QYPtNsVKtcoEMjWVFxaT9Dr6AFp0ZlSqtFy7N3f5
 ouk4sX85bsGEYGn9lFojBMb5ypi50YLMiy6kWBgRqWUqoeVAjc84pMyPxaIXrjCfUlei
 EyuCpB9MQmsikWQl6p5u0K3dOfN3ZEpek34TcxXJzmO0i4tXrxZC1h4LyQsaUP09GR2F
 lfKrfc9w76kSJyFore1UJ8EVm1GisH9YqZQHEBM2atM5BQVnaODwMqw5ePALXw3l2h8x
 ogpaOHpl6WE3gBWKLCPp52Pm/KETbhTHeQIVCKNKRbB+kW0fyTo+MYrAdHosYRMptmnj
 Eeow==
X-Gm-Message-State: AOAM531kHhb0jP4f/wTGLRfBhpSi3iyhJqpzBBP0hz+FqjoTPDtc6XIX
 00l0TQpaIzUuunv62zc/T+oBTvyqWkZ6v1PndxrCrzjQGxE=
X-Google-Smtp-Source: ABdhPJyTzmixSPK70t7lPCtMoSyLGK1eXN80kMcYPOL5nLmjDgqSvFdSns1WgD/f9E2t/hu5ZdpEnTHKKIutn6804ks=
X-Received: by 2002:a37:314:: with SMTP id 20mr4361417qkd.104.1630688386855;
 Fri, 03 Sep 2021 09:59:46 -0700 (PDT)
MIME-Version: 1.0
From: David Janello <djanello@gmail.com>
Date: Fri, 3 Sep 2021 11:59:36 -0500
Message-ID: <CAD=abyhLuq6ig0JXGvc75GjuvgH+CsPJg_io+Qf84H8Zkvs3YQ@mail.gmail.com>
Subject: DSD Recording on RME 2-PRO FS/BE
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Tue, 07 Sep 2021 09:03:12 +0200
Content-Type: text/plain; charset="UTF-8"
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

Greetings,

I am testing native DSD recording using arecord with the RME 2-PRO FS/BE
audio interface.

using command line

arecord -c 2 -Dhw:CARD=Pro53791340 -r 176400 -f DSD_U32_BE audio.dsf

gives output of:

Recording WAVE 'audio.dsf' : Direct Stream Digital, 4-byte (x32), big
endian, oldest bits in MSB, Rate 176400 Hz, Stereo
arecord: set_params:1368: Sample format non available
Available formats:
- S32_LE

Using S32_LE parameter
arecord -c 2 -Dhw:CARD=Pro53791340 -r 176400 -f S32_LE audio.dsf

gives output of

Recording WAVE 'audio.dsf' : Signed 32 bit Little Endian, Rate 176400 Hz,
Stereo

Which appears to be a PCM recording and not DSD.  What is the correct
command line to arecord to capture DSD audio streams and write them to a
dsd file?

Thanks

David
