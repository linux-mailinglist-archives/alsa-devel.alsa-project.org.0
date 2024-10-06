Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3A0991D67
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Oct 2024 10:57:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A846827;
	Sun,  6 Oct 2024 10:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A846827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728205058;
	bh=Wpido9Kf/hvaKPT3kLqwH4CTFoVCPwgVYoycmspxKVg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JDe8yCrmJfcw6ZNK8yCwCLDtMDV0lD0tIfctslC/F0YYtcPPkXQSkb+GOgFO+gOWD
	 jPGwT2fIOXlNgGsW1tK4QKxg18XPaj42Jp4PzbNJN3rQXw4db9Gfr5rFhLj9CJdC4G
	 JJceKzifZwfpG0Rp0oiTjD7JbnpZw6vmczmLm2Bg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77010F80588; Sun,  6 Oct 2024 10:57:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AC1EF8057A;
	Sun,  6 Oct 2024 10:57:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C4C5F80528; Sun,  6 Oct 2024 10:57:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9F1BF8001E
	for <alsa-devel@alsa-project.org>; Sun,  6 Oct 2024 10:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9F1BF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=hw9N2iS+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728205013; x=1728809813; i=markus.elfring@web.de;
	bh=BIrwPlkTYIFaxGZHJcTFOF4qlwUrg6aOe4aE4Kc20jM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hw9N2iS+tT6yz2seCRkfYGlTsBR9U5M2c3ugP957wVDIf7eXavfmHhqEHVGRFiDx
	 NGZuD08/HkCN+kTISHP/7w7it4T+A3yGuyF6PIRA0wwzYM534EbwvCl90vH6/fjSM
	 Bhls+9PCjRWw6MAG9/Apb/sEpw83HwmfyRdsbd5kCevm4ZEdmLP0SX2HeAqeHdqkW
	 oowvblL0TMjz3SBiB2BDmJtyLzbESTHAQSjJUmSvcrKYoGVYtba7kJMzHMpRqYW4A
	 iJ3+kWc51XJys9sDHoHgtfvprA1oiO5pkUKzN0zAZPV+j85U5hSW5c9B0w8g/sCU4
	 BlOEFU7LwhB9Wvj8rw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.87.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MSqXM-1tQV350QOs-00Ro1A; Sun, 06
 Oct 2024 10:56:53 +0200
Message-ID: <6d17006d-ee97-4c7c-a355-245f32fe1fc3@web.de>
Date: Sun, 6 Oct 2024 10:56:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Chenyuan Yang <chenyuan0y@gmail.com>,
 Zijie Zhao <zzjas98@gmail.com>
References: <20241003152739.9650-1-zichenxie0106@gmail.com>
 <ee94b16a-baa7-471c-997e-f1bf17b074b8@web.de>
 <2024100620-decency-discuss-df6e@gregkh>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2024100620-decency-discuss-df6e@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jTPeINaQftL8b2MzXONGYdc/E9Af1aAvOORf/CE0M7cm1Obw5qd
 LU2OVArBY5A4mwcydPSsvUujrrMYmQ03tvpohyPLy2hkEwsEr3pIRUzhMam251qPZ1XLpOl
 BvoQ08Xs33MkDj/IUZFJgbupoeZj1JIPrcuLdz785TXdRiswkCZW7cfiCqTNrWdNCj5JKdJ
 TQ7zKPCYVQu6egYxi9QSw==
UI-OutboundReport: notjunk:1;M01:P0:wiu11a04sOI=;vU2wESOvjSd2DSRm4DJW2MSEhfc
 fEVMQ7wruXhyaYrVabKlQhIfv0Npp/t+RBJEn/swIad3aATLganRZshY6Vs0zV8Z+sqZQj8S1
 OubjqPqqkkjyWywNZrDi/FOBxWYsMYTi0s+Na2t5QHeIrgwTOQg0Ndrtml2sxqqhzkt0ox9I7
 LeoGz8YDPwy7Yv7I0pt0hBz2M5YH478Z+wR4LteTrYmjW//AH84+9ladv8djjdKseTz162ebV
 O+s55JAIM1eHQoXyT0cldVVTlEwFHG4yc6wej2OPDeeRLsnjCPvURhMxmKNgNqJpDYjD8PlHX
 T51milFsMU02UC7G407wsTpx8xakS1EzBh9PnlrTtjIqto4ccDEKzubsv7R3OkU7fjHojynBc
 hcSL3ly7bM2i1Kmg8RRBpI/oUJNg4gKb3ZM06mdy0ANOZS1tYZ0XJTj7FC0SLibI4nqZmTBHz
 BT7Eo8ZT0W0sKma8yLEP1OXnXfaS9XyOynPf+P1tfUTK2wdBi6/SdgfDXaLSal34/VJEBGOul
 cHMfVLjQxRNnMNY20ggTs3qQWj16haf1KVyjwSR17+wonMGbfkFacWLd0nF+Et2PoehLh/AQ6
 OChJUcZ2W8OXFmAtEtP8iJonjgur70AqSJViX8WiFB5wNBvgXaiGleYP952jXKVY8oLxVJ9mn
 mbjPkQKuNwVwFMBu3QTBZ15SM9oC2GzYgg3snzj/08fD2tAPiqpRDwKY5pO3O/lDZuviUwR8u
 1hr/HM+PYN4QiEiBkqJmrJtg33zQ3yywUsCBRxxRKr1AKSq9CMX9a0YmQemp3i7wnZo5+j6eh
 fLX5p6bi1vCtPgulWCWz/aNA==
Message-ID-Hash: QRD5CC2FYD6IYT6B53PH5GPAXOHT6VNO
X-Message-ID-Hash: QRD5CC2FYD6IYT6B53PH5GPAXOHT6VNO
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QRD5CC2FYD6IYT6B53PH5GPAXOHT6VNO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>>> A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could
>>
>>                    call?
>>
>>
>>> possibly return NULL pointer. NULL Pointer Dereference may be
>>> triggerred without addtional check.
>> =E2=80=A6
>>
>> * How do you think about to use the term =E2=80=9Cnull pointer derefere=
nce=E2=80=9D
>>   for the final commit message (including the summary phrase)?
>>
>> * Would you like to avoid any typos here?
>>
>>
>> =E2=80=A6
>>> ---
>>>  sound/soc/qcom/lpass-cpu.c | 2 ++
>>
>> Did you overlook to add a version description behind the marker line?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.12-rc1#n723
=E2=80=A6
> This is the semi-friendly patch-bot of Greg Kroah-Hartman.
>
> Markus, you seem to have sent a nonsensical or otherwise pointless
> review comment to a patch submission on a Linux kernel developer mailing
> list.  I strongly suggest that you not do this anymore.  Please do not
> bother developers who are actively working to produce patches and
> features with comments that, in the end, are a waste of time.
>
> Patch submitter, please ignore Markus's suggestion; you do not need to
> follow it at all.  The person/bot/AI that sent it is being ignored by
> almost all Linux kernel maintainers for having a persistent pattern of
> behavior of producing distracting and pointless commentary, and
> inability to adapt to feedback.  Please feel free to also ignore emails
> from them.
* Do you care for any spell checking?

* Do you find any related advice (from other automated responses) helpful?


Regards,
Markus
