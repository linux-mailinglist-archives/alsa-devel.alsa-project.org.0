Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF9F276105
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 21:26:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B0E417AD;
	Wed, 23 Sep 2020 21:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B0E417AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600889204;
	bh=Fa4ciVATNXt6C4qPR0+yFimj3uY73qwhgdBDWnS4tZ4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fDJho2K0UYWbRG31o1Kx3t1ZqSySgUh23Qw8F9/VyuZ0OI0/t2GvRe8R5ghiRXDT1
	 noV7Z1fmtyDdbFc7VA4lV5AigddIKTw9tu+osQusav8BYDASiblQHoKcAi15UfyXdn
	 +YukrB34ijA8uXGoZERUqZgsQG2fhESovl9kBqQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ED12F80171;
	Wed, 23 Sep 2020 21:25:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BA0FF80171; Wed, 23 Sep 2020 21:24:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B0B7F800B4
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 21:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B0B7F800B4
IronPort-SDR: 1o6KyVErCALxcZiWrXbsg1mFFk3aUg6ff9AbJtveB+5RVial6UwyHQMcn621Gq8HE5qtoJQwIK
 TXCTpi1ZJiow==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="158351102"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="158351102"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 12:24:52 -0700
IronPort-SDR: a5is4JIZ5lrSnRUaKg2PpqqC4OKtmNKZuW27oZcJlJtie+dcMA/RW7Ktt8TDY0j9Dr4TlGL8Hh
 zTSQBdSs69+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="335603294"
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138])
 by fmsmga004.fm.intel.com with ESMTP; 23 Sep 2020 12:24:50 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 23 Sep 2020 20:24:49 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Wed, 23 Sep 2020 20:24:49 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v8 02/14] ASoC: Intel: catpt: Implement IPC protocol
Thread-Topic: [PATCH v8 02/14] ASoC: Intel: catpt: Implement IPC protocol
Thread-Index: AQHWkaS0J+WhWsgCJEmY/BXBACbAu6l2I7uAgAB2RmA=
Date: Wed, 23 Sep 2020 19:24:49 +0000
Message-ID: <39bfea09d0a54c5dae3930408e45b10d@intel.com>
References: <20200923122508.3360-1-cezary.rojewski@intel.com>
 <20200923122508.3360-3-cezary.rojewski@intel.com>
 <20200923131731.GE3956970@smile.fi.intel.com>
In-Reply-To: <20200923131731.GE3956970@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "Proborszcz, Filip" <filip.proborszcz@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Hejmowski,
 Krzysztof" <krzysztof.hejmowski@intel.com>,
 "ppapierkowski@habana.ai" <ppapierkowski@habana.ai>, "Gopal, 
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

On 2020-09-23 3:17 PM, Andy Shevchenko wrote:
> On Wed, Sep 23, 2020 at 02:24:56PM +0200, Cezary Rojewski wrote:
>> Implement IRQ handlers for immediate and delayed replies and
>> notifications. Communication is synchronous and allows for serialization
>> of maximum one message at a time.
>>
>> DSP may respond with ADSP_PENDING status for a request - known as
>> delayed reply - and when situation occurs, framework keeps the lock and
>> awaits upcoming response through IPCD channel which is handled in
>> bottom-half. Immediate replies spawn no BH at all as their processing is
>> very short.
>=20
> ...
>=20
>> +static void catpt_dsp_send_tx(struct catpt_dev *cdev,
>> +			      const struct catpt_ipc_msg *tx)
>> +{
>> +	u32 header =3D tx->header | CATPT_IPCC_BUSY;
>=20
>> +	if (tx->size)
>=20
> This check is not needed.
>=20

It's really the battle between: avoiding memcpy(size=3D0) and size-check.
In the past, reviewers favored the former.

Ack.

>> +		memcpy_toio(catpt_outbox_addr(cdev), tx->data, tx->size);
>> +	catpt_writel_shim(cdev, IPCC, header);
>> +}
>=20
> ...
>=20
>> +	ret =3D ipc->rx.rsp.status;
>> +	if (reply) {
>=20
>> +		reply->header =3D ipc->rx.header;
>=20
> So, even in case of error the header is still updated?
>=20

As per protocol, it is paramount to save the reply header regardless of
IPC status as long as communication with DSP is not severed AKA timeout.
Header contains actual error code provided by DSP firmware. While
existing catpt's implementation isn't granular in regard to error codes,
nothing stops the developer to do so and react differently depending on
the value of error code received.

Without storing the header, caller is blind about the severity of an
error.

>> +		if (!ret && reply->data && reply->size)
>=20
>> +			memcpy(reply->data, ipc->rx.data, ipc->rx.size);
>=20
> This I didn't get. You copy data by using source size?!
>=20
>> +	}
>> +
>> +	return ret;
>=20
> I guess the above piece may be refactored, but I don't know how until it =
is
> clear why it's written like this.
>=20
> ...
>=20

Well, ipc->rx.size equals reply->size as long as IPC procedure is in
progress and reply !=3D NULL. So either ipc->rx.size or reply->size
suffices.

IPC protocol is quite simple here (albeit cAVS arguably is even simpler):

OUTBOX <channel: request - reply model>
TX: copy request header to appropriate register, copy payload to outbox
<IRQ>
RX: copy reply header, copy returned payload only in successful case

INBOX <channel: notification model>
No TX: no direct requests coming from HOST
RX: notifications from DSP, same as RX for OUTBOX applies here

Reply header is always yielded for possibly granular error handling.
Payload is omitted if SUCCESS is not the value of msg status.

Before the message is sent (catpt_dsp_do_send_msg()), it is validated
against maximum payload size and ipc status fields are re-initialized -
catpt_ipc_msg_init(). From them on, msg completion is awaited.

If we are dealing with standard IPC, reply should arrive no later than
within 300ms (in vast majority of cases, this won't reach 30ms) and be
found within outbox's RX. In case of heavy IPCs e.g.: reset
offload-stream, reply (ack) is yielded immediately from DSP, no
processing is done between and instead, DSP delegates the heavy task for
later. Response for that heavy task completion should arrive no latter
than 300ms from the moment initial reply (ack) was received and this
time, inbox's RX is used instead.

So, since catpt_dsp_copy_rx() knows nothing about caller's reply
(pointer to store the received data into), rx.size is assigned to
reply->size during the initialization phase so it can be reused during
that very moment - copying rx as there is no need to access SRAM if no
payload is expected.

>> +static void catpt_dsp_copy_rx(struct catpt_dev *cdev, u32 header)
>> +{
>> +	struct catpt_ipc *ipc =3D &cdev->ipc;
>> +
>> +	ipc->rx.header =3D header;
>> +	if (ipc->rx.size && ipc->rx.rsp.status =3D=3D CATPT_REPLY_SUCCESS) {
>=20
> Check for size is redundant.
>=20
>> +		memcpy_fromio(ipc->rx.data, catpt_outbox_addr(cdev),
>> +			      ipc->rx.size);
>> +	}
>=20
> Can be done like
>=20
> 	if (status !=3D SUCCESS)
> 		return;
> 	memcpy_fromio(...);
>=20
>> +}
>=20

Ack for both. The reduced indentation is very good suggestion, thanks!

Czarek

