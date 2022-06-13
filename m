Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6325480EB
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 09:56:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C52BA1833;
	Mon, 13 Jun 2022 09:55:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C52BA1833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655106968;
	bh=lDaa0x2GN8C7IRucbOTFPS5Ur8QUMkEgKck2U2cgnuo=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pOHwFHIOkTP/IdUujSawCDLo+26c9vsc4FcmuvuPWUEvB+Ck+leFXi1valzbgrB6Q
	 lciu7UV+BQ8pBkzlPa6jvr4SG/NlytB/2Ic4v9x+zGnx/GQGjjo5kp4SwixjifFetF
	 PX7hu8NtBm7bl0sR/TZ8TcIGRlmON8+205FbViGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 279C6F8052D;
	Mon, 13 Jun 2022 09:55:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06810F80529; Mon, 13 Jun 2022 09:55:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFE25F80527
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 09:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFE25F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Eqf28ZKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655106892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8KA2tdgBtWilkklHEWzpMLQTc0xPoX4XF1nTpf16OPM=;
 b=Eqf28ZKFUY6/CS960sMhg+H4ZfvNccL7YsRNQ7M32JqSArF3gZ4w+zPwwKiP+Fv1YuVCMP
 CA+jvtZvogWMXc14/cw13qRRvaomEC6hlRtIj24IxnOfFJyhrvoCF83lgvTBdYJlbZqois
 t0ag2EGWfqv7mOT4JwPqK1MaKCAOqc8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-2qjXfCzMMaGmU-PN44yUeA-1; Mon, 13 Jun 2022 03:54:50 -0400
X-MC-Unique: 2qjXfCzMMaGmU-PN44yUeA-1
Received: by mail-ej1-f70.google.com with SMTP id
 z7-20020a170906434700b007108b59c212so1476466ejm.5
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 00:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=8KA2tdgBtWilkklHEWzpMLQTc0xPoX4XF1nTpf16OPM=;
 b=HOVrBw8p6+m94iB8HZqNB4j9Zsxxkagiy8kA417Wjd3bKoI0cZ/Bw5KFKhomV2e8QU
 GXrppaFEjTBK1W7z3HULoUXpiXUu/69aWZ8+cthE7z6v6zdDfLQnLYdv/nWhnhOjWWu+
 EWxqy23LXrjYKCm+KqD98Qd/uta1pSGc/vr0Tyrp57lAh4C0ok8rS49OyW9zUKapR2lg
 Q0k8eAIyzKWwsqrjnV4Ez3fhjvr1AZZE9EMl7/0fdxtrFC0Mtc7zd8ytB75923/0ZMHl
 P04YQdmajzTyUUN1VXe0T5vdAdElTx5C12y70deHD9zyO0kT7PnLklX0bIgYTXTzNE0x
 4cfA==
X-Gm-Message-State: AOAM532ZvVhNi3M+cxDza77BlXy7xZC7Wvca6JJV3OnFCdtPi4eqGBnj
 AJl0gfDAt8/U1f/Ri7QSeh5nIjuxNg41yRSC6i+86E2abahV+zhTp2iIlpV9Ujm0wH1tJrAWokR
 UAjIltqVEoj0vnVQR0KxPq/l8cKqEeNdcAeuR/Wy4ESLk4bxdateQV80IHwGjvuCrsvCDJXepxa
 Q=
X-Received: by 2002:a17:906:2086:b0:712:1257:77bf with SMTP id
 6-20020a170906208600b00712125777bfmr17769301ejq.655.1655106889135; 
 Mon, 13 Jun 2022 00:54:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw/4+VdF9/ZnQSicK7+nINbzhlIawBJY+NiHwDtIr3xM6F8oAwVUFdr0StTiLQzjIJImH0nA==
X-Received: by 2002:a17:906:2086:b0:712:1257:77bf with SMTP id
 6-20020a170906208600b00712125777bfmr17769287ejq.655.1655106888936; 
 Mon, 13 Jun 2022 00:54:48 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a17090679d700b006f3ef214dd9sm3522752ejo.63.2022.06.13.00.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 00:54:48 -0700 (PDT)
Message-ID: <7e3aa97a-77c9-3367-8929-a86049286d75@redhat.com>
Date: Mon, 13 Jun 2022 09:54:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: How to add 2 different SND_PCI_QUIRKs for 2 models with the same PCI
 subsys vend + prod ids?
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "nikitashvets@flyium.com" <nikitashvets@flyium.com>
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

Hi All,

There is a problem with the sound on the Lenovo Yoga Duet 7 13IML05, which
requires a SND_PCI_QUIRK to fix. But there already is an existing quirk
for another Lenovo laptop using the same  PCI subsys vend + prod ids.

For more details see:
https://wiki.archlinux.org/title/Lenovo_Yoga_Duet_7_13IML05#Audio

So I guess this means that we need to add a way to also include a DMI match
for SND_PCI_QUIRKs ?

Maybe add a:

const struct dmi_systemid *dmi_ids;

member to struct snd_pci_quirk and a new
SND_PCI_QUIRK_DMI macro to set this?

Regards,

Hans

