Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 584BE327FD1
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 14:45:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C375116A9;
	Mon,  1 Mar 2021 14:44:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C375116A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614606341;
	bh=euuqEO96cTVWTdaHaBuGgt18SU7CB5O2JSEs/IGSseQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RmEbg6HAtu3aWSdjCOcPujJpUKDSijWZKcGAvrf4BZ21KFLHQvLumIZPgAJnzTS3v
	 U8ZeUUiEVSuFA+zzj+4Lfu455b9pdKPFkDm/AzwaJTOvJywGUoB4CBAyTxbRNFCrsE
	 HSov2hslGRSwzunLfx41cX0r5GnzGgyNUrRmxevI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E50EF804E5;
	Mon,  1 Mar 2021 14:43:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 909B3F80234; Fri, 26 Feb 2021 14:35:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_NONE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67E42F80159
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 14:35:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67E42F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jTmI09ll"
Received: by mail-wm1-x332.google.com with SMTP id i9so7147748wml.0
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 05:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=euuqEO96cTVWTdaHaBuGgt18SU7CB5O2JSEs/IGSseQ=;
 b=jTmI09llVXuiVcNLV0W5G7ObUfcLq3KTf0AKetjWRTpCqhxH3KVQL3LOn0GPO60QHP
 2FNviYxBl8BstRek69Uvsoo0sXZVUx/6OJmXKIbOVrKufnWMdMph+7dfMnKCP1B667t0
 X9u9fDXJzeSKH3yKRj6NjUmytMCvZbmu0lc8X72MvAEbKAvUAyUBbVptuleydu4mrt1a
 TPJrl9iq5k8WNzwfiGnyYiXlgShgAyyIC1Q5I9VgikmRcCYooIGc0tNLBh7oH2J5s8di
 tvDt2GwgAwbikwMIjA0cl7/RTfieo0yTvbJ4vIPLj9hhmeqxCi967k4MNo8J327f4W0P
 gJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=euuqEO96cTVWTdaHaBuGgt18SU7CB5O2JSEs/IGSseQ=;
 b=CVpip36+3nqLdbp2W9NMT5DHN4fR18bwn9jVEAvBqz2Wl+yov7CCcrRrE2x6zhnWSA
 biHcetyhgH7O+b7/RUZiwkxYmwubmVpXGhDfeubq5m8b/wShTp6hsJGGyG6ctBuoRYDY
 9j1JlZtds8Bzju0QqfGWgFJ0l+ctnyATqTz7ibOJ7DArA2Vr6qf4BgbOP/NhW2b2Fglv
 LH0hQfzfRGmH0oHy93m/j7qwAuAlKtbo9t3jSY8PxbfR9xibNyaaovA2yGKOBUqfIGl/
 gzB1FWKp3W11hKEbmSJX8OoRhXryWrHs51uUf4TxZHvx+UiWcZlLvaBqx4GY92dXihGG
 Ds0Q==
X-Gm-Message-State: AOAM532Y4Ldt4jMI7DPslVwQG9bPPT3J28iVJnsh15E5LzeW9wO04DT6
 njHFlV6YT5zsyJgxS4lhPzDudPQ5mff4tS1V
X-Google-Smtp-Source: ABdhPJysmoW6J1MbrCJVMJy37R2Ndr++5hkRdZ5SBBRxG9EElXoN8DYYYcs/w5BrgXMHv0RnAAH9TA==
X-Received: by 2002:a1c:4683:: with SMTP id t125mr2901762wma.75.1614346517948; 
 Fri, 26 Feb 2021 05:35:17 -0800 (PST)
Received: from localhost.localdomain (176-171-138-112.abo.bbox.fr.
 [176.171.138.112])
 by smtp.googlemail.com with ESMTPSA id c26sm13175547wrb.87.2021.02.26.05.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 05:35:17 -0800 (PST)
From: Nicolas MURE <nicolas.mure2019@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4]: ALSA: usb-audio: Add Pioneer DJM-850 support
Date: Fri, 26 Feb 2021 14:34:25 +0100
Message-Id: <20210226133429.20081-1-nicolas.mure2019@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Mar 2021 14:43:22 +0100
Cc: Nicolas MURE <nicolas.mure2019@gmail.com>, livvy@base.nu
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

Hello,

This patches serie adds support for the Pioneer DJM-850 mixer. The mixer
has a 24bits (little endian) sound card, which features 4 stereo
channels for capture and 4 stereo channels for playback.
The mixer also has controls to specify the capture source for each
channels, and also a control to set the sample rate (44.1kHz, 48kHz,
96kHz).

Thank you :)

Signed-off-by: Nicolas MURE <nicolas.mure2019@gmail.com>


