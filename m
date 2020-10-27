Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EDB29AB6E
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 13:06:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 989DB1676;
	Tue, 27 Oct 2020 13:05:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 989DB1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603800361;
	bh=NvQKMKHVKv7I6NF6itbPiqp1Rj01gL/y/qABY6cXyoo=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qCIuf9/C32Yq+ABawWDWjO+xjLOS3TImTDbe4kfburVrCckbQIgNhNxuLZnfoCcx2
	 cMt4al8bBUou4CFHjzanP2cH3jMlzRgVcmf31/YET0Mm02gXfmKQnHTM30N3dukU+W
	 952nW5Lk0rMwbKVZbdPbd6dwNX48plI1o6h8xHfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC687F801D8;
	Tue, 27 Oct 2020 13:04:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3720CF8020D; Tue, 27 Oct 2020 13:04:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B277F8019D
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 13:04:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B277F8019D
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kXNi9-0002wj-Rb
 for alsa-devel@alsa-project.org; Tue, 27 Oct 2020 12:04:22 +0000
Received: by mail-pl1-f200.google.com with SMTP id r9so772473plo.13
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 05:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=g5lMmHon4rLqdhfDcuQVTLa+kEfIqO1qNhvdTbwo9VE=;
 b=qRFU2UQoyF193XAS936vELnZhPGrbeJKWjZE0yYHJwtzLMqzXglHYVGVvXP6wUGSJC
 NopTLNE+SOejsp5WGzyyn+qwM4ACkc+Uaw8RODKdo8nG3VNSScJjSAll6LycU7Kg+Ien
 QSoZ5nYwljFYnFjuOj116zDRiNuYL/3+nX9ycLl08BkWzM7Pl4p2M1scPW8sQO/cGafi
 /XO3thsiv3wzNrrWo5iMbFqhg5A55h/XJLwMMnCsZar6cezUePvLoAPnLZqcP04HMfNH
 tT79WkkLDEPbqdu9nVdPmTfm9t5EccIQhuhO9NOTSN6ZnZ9YCMtKAamA5LY5DIqITzbG
 t4Vg==
X-Gm-Message-State: AOAM530aw3122QFJxBJkGgL+97AOGwisd2av4C149rdcLi9NsOqolg84
 RRUrzMKpzlS76Unpz03tNVR62e3jP24bFN8F28pVJTifb4smMabHOH0ct50/URE3O5yE3rtdifW
 HZuaAEV1HOh1Wm4bqV84I5INukTWjf4VZzyuA58BQ
X-Received: by 2002:a62:e811:0:b029:164:4551:926c with SMTP id
 c17-20020a62e8110000b02901644551926cmr771326pfi.27.1603800260504; 
 Tue, 27 Oct 2020 05:04:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkwkAm24quZb/7ZS367uG9huFpMxKFdCxU2Jbv7cnHasxj90Xl93+QTMO+B+KuQgU2yXpsFw==
X-Received: by 2002:a62:e811:0:b029:164:4551:926c with SMTP id
 c17-20020a62e8110000b02901644551926cmr771279pfi.27.1603800259984; 
 Tue, 27 Oct 2020 05:04:19 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id e23sm2099586pfi.191.2020.10.27.05.04.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 05:04:19 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v2 3/4] ALSA: hda: Separate runtime and system suspend
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <alpine.DEB.2.22.394.2010271317430.864696@eliteleevi.tm.intel.com>
Date: Tue, 27 Oct 2020 20:04:16 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <468FD7B1-A6A6-4D0B-B27B-B66696424A48@canonical.com>
References: <20201027054001.1800-1-kai.heng.feng@canonical.com>
 <20201027054001.1800-4-kai.heng.feng@canonical.com>
 <alpine.DEB.2.22.394.2010271317430.864696@eliteleevi.tm.intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Cc: hui.wang@canonical.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org
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

Hi Kai,

> On Oct 27, 2020, at 19:38, Kai Vehmanen <kai.vehmanen@linux.intel.com> =
wrote:
>=20
> Hi,
>=20
> thanks, this looks like a good improvement! Some minor notes:
>=20
> On Tue, 27 Oct 2020, Kai-Heng Feng wrote:
>=20
>> Both pm_runtime_force_suspend() and pm_runtime_force_resume() have
>> some implicit checks, so it can make code flow more straightfoward if =
we
>> separate runtime and systemd suspend callbacks.
>=20
> straightforward -> straightforward
>=20
> and systemd? Maybe just "system suspend"? :)

Typos :)
Will update them in v3.

>=20
>> While at it, also remove AZX_DCAPS_SUSPEND_SPURIOUS_WAKEUP, as the
>> original bug commit a6630529aecb ("ALSA: hda: Workaround for spurious
>> wakeups on some Intel platforms") solves doesn't happen with this
>> patch.
>=20
> Hmm, so this was gone already with the v1 version (so not related to=20=

> programming the WAKEEN when going to system suspend)?

Yes, I was worried that this cleanup may regress the user again.

>=20
>> @@ -143,6 +143,7 @@ struct azx {
>> 	unsigned int align_buffer_size:1;
>> 	unsigned int region_requested:1;
>> 	unsigned int disabled:1; /* disabled by vga_switcheroo */
>> +	unsigned int prepared:1;
>=20
> I wonder if "pm_prepared" would be better as ALSA API has a prepare =
method=20
> as well and this is not related. OTOH, if ok to Takashi, ok for me as=20=

> well.=20

Sure, I think we should use different terms.

>=20
>> +	azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
>> +		   ~STATESTS_INT_MASK);
>=20
> This would fit to one line now.=20

Ok, will concat the lines.

Kai-Heng

>=20
> Br, Kai

