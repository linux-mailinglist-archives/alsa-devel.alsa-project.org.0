Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4493F307825
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jan 2021 15:34:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D812F1693;
	Thu, 28 Jan 2021 15:33:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D812F1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611844473;
	bh=cwxHEwFgy/+izGyU5moJ8fMqrUq1ROg3L2awALVOokw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RaDFDiyF1WKrrm4ge4xrCw1dHIfkdADH0ciqOE+Hbm16UQJ/WHGBj2Ahuce8BBS9e
	 I7jPMedWOCEcgnEYAwkAS71yyAWaee+6GTyGRdRft9qEPpEtG1GMI3EcbdSsciKAaq
	 pMemrKV2pcHV2CXB5ifz9qCM5Ghlohz06fnZdAsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2490CF800D1;
	Thu, 28 Jan 2021 15:33:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02AF2F8015B; Thu, 28 Jan 2021 15:33:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8006CF800BE
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 15:32:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8006CF800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ESlRX4mh"
Received: by mail-wm1-x32e.google.com with SMTP id m1so1485484wml.2
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 06:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RgS33G5QpkhweaMQZ/TRkHVV39bMFkPn1ijz5ZbkFpA=;
 b=ESlRX4mhGhk7EzrC+L7ikmD+Gk4yC+pCaLbT3ZXZfJp+xGElcG5VdkzTaaBZhSK+6I
 4W8wWr2rMUpCaPiA8DlmnrmS6L2/cPS0GdQbzFXJbohe5vG7vjLSuagPT0mo6qvFLbaQ
 9i4V1NEs7FlTdEsEwdgKZeQzMAoS/nAnG/BaSVXEQOU0r58mdy1vx/QTNcTrdZlXweUZ
 UyqZc79EFi79Hnl2+mqsVUiS3czJWAriMWlQ7wjMUWhH+I3XXVYvVwRlDIRR5zbnxqU1
 Kiox9uT70oaKF+A/B8bptmXyBZZK/AKpCYbfhE3Psbk1jodcKXfpxMmWzRm27PBiuEQ6
 xMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RgS33G5QpkhweaMQZ/TRkHVV39bMFkPn1ijz5ZbkFpA=;
 b=M8EFWPZMxxvEn6zBRTOYRKgb5m+yJsTExHWClbPnQkJ5s1kyXT0qCPV2CMyAqbDamZ
 MXpUYi24R7Vr0bXprBLstVZPid7Y4dRr3wPJJDq5FSFvKIPcpXD7ySVAeOU7bZU2KRFW
 L0rGxnEufvspBS1Vm3QMxyznUWsVO67ou5WLs5Opxvva9C4ZeetL35877j/lGAqlNxbG
 H3u0OWiuO92biSoAXe+e6z+o1+3Zhd210JLV88hjcNft1JK6oGSlxdG+bRY9vFExwYL6
 GYyLPr4wf5YUQYSo1s7G9ZI0+m0BulyhAFFOCQjd7exsG/MzzIzDRxOVZe6ipHnL/U59
 q6SQ==
X-Gm-Message-State: AOAM533MomMJilVz2gyCJDSW4250A2Ctcu9iL+anXjdSNw+VfcktP8Vt
 9V/q1b4oEJnLklQ+aAcm2nMMrAarGdTlxgY8UWc=
X-Google-Smtp-Source: ABdhPJy/rfCKGga6jpnBvbZP6RfUs4yzsi62pCuciAd3dV+sjkluWG5HRG/OMKS6llrBEHYMhQXpN3tbeR5L0dC/+zo=
X-Received: by 2002:a1c:e0d4:: with SMTP id x203mr8948783wmg.160.1611844373331; 
 Thu, 28 Jan 2021 06:32:53 -0800 (PST)
MIME-Version: 1.0
References: <CA+GA0_sPC3rp5K4qwZm-u+W1C=+2Y2p-dbF4DMdHkKaTpeKKkg@mail.gmail.com>
 <CAJZ5v0iapmc8ywuySwexwTagKr89Hj7TPXkAvd_HXMhdLoyyQQ@mail.gmail.com>
 <1f0f7273-597e-cdf0-87d1-908e56c13133@linux.intel.com>
 <CA+GA0_v3JUWS3G3=R4XuQ=OW91cpwiBP1Rp=uzYOF8c9TUJ46w@mail.gmail.com>
 <CA+GA0_sCdowanpZmg==c+xVqqNxG5whLGsKHaCfSmpERBhqMzA@mail.gmail.com>
 <1dc2639a-ecbc-c554-eaf6-930256dcda96@linux.intel.com>
 <CA+GA0_sZm2pqOfA3LsNQowb930QS_g5CiCCGthzsS=vAjB9Rjg@mail.gmail.com>
 <CAJZ5v0h+Kwn5u293QO+H2rfGx-ZMBr18tMCLB7jHKHWWRaovOw@mail.gmail.com>
 <CAJZ5v0h8abkdrdN97RHouzxynPBFXBoAuMSb7Zy56+-sTXkPKQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0h8abkdrdN97RHouzxynPBFXBoAuMSb7Zy56+-sTXkPKQ@mail.gmail.com>
From: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@gmail.com>
Date: Thu, 28 Jan 2021 15:32:37 +0100
Message-ID: <CA+GA0_vYdxFj_SPWgdkufo04VaOuWqcNTSck6gvnMfN07ZdO_Q@mail.gmail.com>
Subject: Re: Crash in acpi_ns_validate_handle triggered by soundwire on Linux
 5.10
To: "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Erik Kaneda <erik.kaneda@intel.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Len Brown <lenb@kernel.org>
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

czw., 28 sty 2021 o 13:39 Rafael J. Wysocki <rafael@kernel.org> napisa=C5=
=82(a):
> The only explanation for that I can think about (and which does not
> involve supernatural intervention so to speak) is a stack corruption
> occurring between these two calls in sdw_intel_acpi_cb().  IOW,
> something scribbles on the handle in the meantime, but ATM I have no
> idea what that can be.

I tried KASAN but it didn't find anything and kernel actually booted
successfully.

Comparing to the initial log, there are some new ACPI messages,
but they were present also in the log with acpi_debug enabled:

"No Local Variables are initialized for Method [_STA]
No Arguments are initialized for method [_STA]"

Full kernel log here:
https://people.freedesktop.org/~mslusarz/tmp/kasan.txt
