Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5E92C790E
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Nov 2020 13:26:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54137185D;
	Sun, 29 Nov 2020 13:25:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54137185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606652768;
	bh=343BsRWhjH0YMRTWTN2KWvwobv+IvV8XYusheLMYG3k=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IWCT1VSCVHhC3gVu6XIyrgnVoPakOYvBEOUAxsP8UUSq2x/D1373iphQ0nV79mLSn
	 /ZnUWBg4WI/9Pn/cG9DocauI1yYA9AihsqQ0lYPV06RnxFYIQ8NMgfi4smahdjHtw0
	 Tu4zFG4J7UyhpL9Hg0P6Tv2JTnNipMnt2bV9zjZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C208EF800D0;
	Sun, 29 Nov 2020 13:24:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56301F80168; Sun, 29 Nov 2020 13:24:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_135,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAD78F800D0
 for <alsa-devel@alsa-project.org>; Sun, 29 Nov 2020 13:24:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAD78F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="cP/JyePF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606652666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0e0g5vUDVH8Rmyrs90GT0KJ6kl188LCKOV+l3ewhel8=;
 b=cP/JyePFkmoSrO6mad1i40pLdwrn8lBatdfAKjYqrx5HiAxYa9DWWRCEEZCk8o96pXhH01
 PJWMzkB0bfrZT2hPEwm0+cqn452rjKGFw4HHHL0GNsokv9OVh2qwR1ezsg4sN5lHvNWWtm
 3/vMlZsTLnnw8rGGzVRZPXj2CriCM4A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-ewSg2ZKpNcqb82Gio0_SEA-1; Sun, 29 Nov 2020 07:24:22 -0500
X-MC-Unique: ewSg2ZKpNcqb82Gio0_SEA-1
Received: by mail-ed1-f72.google.com with SMTP id g8so5077102edm.7
 for <alsa-devel@alsa-project.org>; Sun, 29 Nov 2020 04:24:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=0e0g5vUDVH8Rmyrs90GT0KJ6kl188LCKOV+l3ewhel8=;
 b=P496EYXL9UIMcqzVGmGxjQMkzjWI8GlXHnPpE0/X3QFkbDs6LashVWqXgRVxet/DLw
 0xcGr0Z1e5BHi5WJWoRDrVKnLxTpxiTfnFct1oIvyclmkvj/AuqmqEDZ793qol4EB2Lq
 32NrV9Zc1kQlOtznDWhStj9/4ZkMi9Jh8X15ah1d5GEzRpjrk5C+zDg4Ld/X741OsZqV
 QhuqUauzFfqiNvJuLj6/+wNzoiMI1wW3TWYT+zQeOUOU8KTbKR1/f4WdPa1xmTQWzBFm
 GrjTRgPb9coYQ0/84Ts8UDUK1X0OBAefGrl7+HlKADN/tlnt4UEczZj/lme7Xiz/dPk0
 n+uA==
X-Gm-Message-State: AOAM532iHv60UgtOmsYghDpxbDfVit81pSJU3IJt0CP0ts/Mu73p9HSq
 05t9NEuAcR0+hT9IIRwkYIvMA7tcySuSqzE3VS0RIQIyVkVhHe4kUYpdii2tNIKwytmihy2EZgH
 InRcxQ4V9S6jfDQ3z+YCqLlNT/OVPEYrwgdETmbGfDCtacgaFWy1Nuz0PFNF1RJtqBcGo6KD7an
 Y=
X-Received: by 2002:a17:906:60c8:: with SMTP id
 f8mr15802326ejk.14.1606652661200; 
 Sun, 29 Nov 2020 04:24:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtb1JqPxrKGO7XxtmknWgIZgyjSv4GbmV3bEg8Kf0mm49bPHvnBOXPQDvxCSAHGXCtNy76Mw==
X-Received: by 2002:a17:906:60c8:: with SMTP id
 f8mr15802312ejk.14.1606652660963; 
 Sun, 29 Nov 2020 04:24:20 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id y17sm1977295ejq.88.2020.11.29.04.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Nov 2020 04:24:20 -0800 (PST)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: Asoc: Intel: SST (CHT) regression in asoc/for-5.11
Message-ID: <93cc93a1-82bd-f5a3-4e19-4cfc65c868e7@redhat.com>
Date: Sun, 29 Nov 2020 13:24:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

To test the code to dynamically switch between SST/SOF support on BYT/CHT
from the kernel commandline I merged:

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/log/?h=for-5.11

Into my personal tree (mostly Linus' master + some pending patches from
myself).

After this I was getting the following errors in dmesg when using sound on
a Medion E2228T laptop with a CHT SoC + NAU8824 codec:

[   53.805205] intel_sst_acpi 808622A8:00: Wait timed-out condition:0x0, msg_id:0x1 fw_state 0
[   53.805479] intel_sst_acpi 808622A8:00: fw returned err -16
[   53.806281] sst-mfld-platform sst-mfld-platform: ASoC: PRE_PMD: pcm0_in event failed: -16
[   54.829548] intel_sst_acpi 808622A8:00: Wait timed-out condition:0x0, msg_id:0x1 fw_state 0
[   54.829596] intel_sst_acpi 808622A8:00: fw returned err -16
[   54.829668] sst-mfld-platform sst-mfld-platform: ASoC: POST_PMD: media0_out event failed: -
[   55.853230] intel_sst_acpi 808622A8:00: Wait timed-out condition:0x0, msg_id:0x1 fw_state 0
[   55.853244] intel_sst_acpi 808622A8:00: fw returned err -16
[   55.853269] sst-mfld-platform sst-mfld-platform: ASoC: POST_PMD: codec_out0 mix 0 event fai
[   56.876435] intel_sst_acpi 808622A8:00: Wait timed-out condition:0x0, msg_id:0x1 fw_state 0
[   56.876481] intel_sst_acpi 808622A8:00: fw returned err -16
[   56.876563] sst-mfld-platform sst-mfld-platform: ASoC: POST_PMD: media0_out mix 0 event fai
[   61.847455] intel_sst_acpi 808622A8:00: FW sent error response 0x40015
[   61.847564] intel_sst_acpi 808622A8:00: fw returned err -1
[   61.847659] sst-mfld-platform sst-mfld-platform: ASoC: error at snd_soc_dai_startup on ssp2
[   61.847722]  SSP2-Codec: ASoC: BE open failed -1
[   61.847754]  Audio Port: ASoC: failed to start some BEs -1
[   61.847786] intel_sst_acpi 808622A8:00: FW sent error response 0x40006
[   64.301284] intel_sst_acpi 808622A8:00: FW sent error response 0x90001
[   64.301545] intel_sst_acpi 808622A8:00: not suspending FW!!, Err: -2

Dropping the asoc/for-5.11 merge and just cherry-picking Pierre-Louis' changes
for the dynamic switching makes these go away. So this seems to be caused by
other changes in asoc/for-5.11.

So any clues where to start looking for this, or should I just bisect this?

Regards,

Hans

