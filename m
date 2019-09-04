Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A80F9A828B
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 14:37:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2375516B8;
	Wed,  4 Sep 2019 14:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2375516B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567600650;
	bh=kGLWK3fUnCmGkhCYq0LAHtqxecSzTbnz/wYnr6Geg34=;
	h=Date:From:To:To:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C3YXrUxmxMXOaBJtUbbiv329oK49TzW/HkpuS+NT2KH1xjs2cnWl2LKYL95BtZZsZ
	 8mQyH7HjkP2X2PkMD0qDylg+SyCrlgnR/Hguyd7gqp00D4qa2HU1XEje6KKZNaiBq2
	 bYV9j76S36Ha4ZWOsQzllBl6t49AnSB85GaxvpKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80A74F80228;
	Wed,  4 Sep 2019 14:35:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E124F803A6; Wed,  4 Sep 2019 14:35:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0BF2F8011E
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 14:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0BF2F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qbjUis1s"
Received: from localhost (unknown [40.117.208.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED0DD23402;
 Wed,  4 Sep 2019 12:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567600535;
 bh=tPUbwpTSV2h9QUZkQKDoPP8mk4/cEB+ba4F4eQQvKIo=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=qbjUis1sW00d/fzu5weVbWWHby7E7MMDlUC6It0itDeaSMnB7gZl7rU1n+Ua1E0mv
 VyC1iZKJjFBrygRNuqi3sk06i7XZvc3gnKcl14GfyfuqxMoMlhl2TEf+jwuvcrZswR
 tbECvVd3otfhfKtVdXCklQnOj4L3GphPn8crRzB8=
Date: Wed, 04 Sep 2019 12:35:34 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20190904055327.9883-1-hui.wang@canonical.com>
References: <20190904055327.9883-1-hui.wang@canonical.com>
Message-Id: <20190904123534.ED0DD23402@mail.kernel.org>
Cc: stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ALSA: hda/realtek - Fix the problem of two
	front mics on a ThinkCentre
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.2.11, v4.19.69, v4.14.141, v4.9.190, v4.4.190.

v5.2.11: Build OK!
v4.19.69: Build OK!
v4.14.141: Build OK!
v4.9.190: Failed to apply! Possible dependencies:
    216d7aebbfbe ("ALSA: hda/realtek - Fix headset mic and speaker on Asus X441SA/X441UV")
    5824ce8de7b1 ("ALSA: hda/realtek - Add support for Acer Aspire E5-475 headset mic")
    615966adc4b6 ("ALSA: hda/realtek - Fix headset mic on several Asus laptops with ALC255")
    823ff161fe51 ("ALSA: hda - Fix click noises on Samsung Ativ Book 8")
    8da5bbfc7cbb ("ALSA: hda - change the location for one mic on a Lenovo machine")
    9eb5d0e635eb ("ALSA: hda/realtek - Add support headphone Mic for ALC221 of HP platform")
    c1732ede5e80 ("ALSA: hda/realtek - Fix headset and mic on several Asus laptops with ALC256")
    c6790c8e770c ("ALSA: hda/realtek - Add support for headset MIC for ALC622")
    ca169cc2f9e1 ("ALSA: hda/realtek - Add Dual Codecs support for Lenovo P520/420")
    f33f79f3d0e5 ("ALSA: hda/realtek - change the location for one of two front microphones")

v4.4.190: Failed to apply! Possible dependencies:
    1a3f099101b8 ("ALSA: hda - Fix surround output pins for ASRock B150M mobo")
    216d7aebbfbe ("ALSA: hda/realtek - Fix headset mic and speaker on Asus X441SA/X441UV")
    5824ce8de7b1 ("ALSA: hda/realtek - Add support for Acer Aspire E5-475 headset mic")
    615966adc4b6 ("ALSA: hda/realtek - Fix headset mic on several Asus laptops with ALC255")
    78f4f7c2341f ("ALSA: hda/realtek - ALC891 headset mode for Dell")
    823ff161fe51 ("ALSA: hda - Fix click noises on Samsung Ativ Book 8")
    8da5bbfc7cbb ("ALSA: hda - change the location for one mic on a Lenovo machine")
    9b51fe3efe4c ("ALSA: hda - On-board speaker fixup on ACER Veriton")
    9eb5d0e635eb ("ALSA: hda/realtek - Add support headphone Mic for ALC221 of HP platform")
    abaa2274811d ("ALSA: hda/realtek - fix headset mic detection for MSI MS-B120")
    c1732ede5e80 ("ALSA: hda/realtek - Fix headset and mic on several Asus laptops with ALC256")
    c6790c8e770c ("ALSA: hda/realtek - Add support for headset MIC for ALC622")
    ca169cc2f9e1 ("ALSA: hda/realtek - Add Dual Codecs support for Lenovo P520/420")
    f33f79f3d0e5 ("ALSA: hda/realtek - change the location for one of two front microphones")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

--
Thanks,
Sasha
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
