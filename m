Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEF88043CA
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 02:11:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B711F828;
	Tue,  5 Dec 2023 02:11:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B711F828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701738700;
	bh=8BiZMUBqFgvhcw71b/vE0KXYQzDiGF+jawjpDE7q6Fo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kQ7dYZ7iQqZykGm/qiX4EEW+nwLAC2zoXzr4m1p6DBxxHVBrrAt6FsckHbBXUdp9W
	 upf6RJuZ3p15W8DJ3AJgE7OneT8GE3ejGK34+LLa9BtI9YUkoMddOqhGRiF5cW/YHt
	 m+Gm4y/fduu0kSQ/pLnMk81HckvKeUXlysYOBNzI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC016F8057A; Tue,  5 Dec 2023 02:11:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CB2EF80571;
	Tue,  5 Dec 2023 02:11:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4C44F8024E; Tue,  5 Dec 2023 02:11:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 6E2B9F800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 02:11:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E2B9F800F5
Received: from [192.168.2.4] (51b68398.dsl.pool.telekom.hu
 [::ffff:81.182.131.152])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000071433.00000000656E78A6.00115099;
 Tue, 05 Dec 2023 02:11:02 +0100
Message-ID: <ba7ed44fdcfe0a3a80024f0ecdfa4e5255cc48c6.camel@irl.hu>
Subject: Re: [PATCH 1/2] ASoc: tas2563: DSP Firmware loading support
From: Gergo Koteles <soyer@irl.hu>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
  Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Date: Tue, 05 Dec 2023 02:11:01 +0100
In-Reply-To: <7a919eef-d9b4-4bcb-bc19-9a6868d1cc54@linux.intel.com>
References: <cover.1701733441.git.soyer@irl.hu>
	 <c7d0fc477393550cc29624f33361d94ad987259f.1701733441.git.soyer@irl.hu>
	 <7a919eef-d9b4-4bcb-bc19-9a6868d1cc54@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0
Message-ID-Hash: HUDGKLGLLMLUPVJOD3LMUYQ5WKXB26CV
X-Message-ID-Hash: HUDGKLGLLMLUPVJOD3LMUYQ5WKXB26CV
X-MailFrom: soyer@irl.hu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HUDGKLGLLMLUPVJOD3LMUYQ5WKXB26CV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre-Louis,

Thank you for your review.

On Mon, 2023-12-04 at 18:05 -0600, Pierre-Louis Bossart wrote:

> >=20
> >  sound/soc/codecs/tas2562.c                    |   2 +-
>=20
> are tas2562 and tas2563 (from commit subject) the same?
>=20
No, tas2563 is register compatible with tas2562.

> >=20
> > +#include <linux/slab.h>
> > +#include <linux/delay.h>
>=20
> nit-pick: alphabetical order?
>=20
Good idea, I'll fix it and the others in the next version.

> > +
> > +#include <sound/tas2562.h>
> > +#include <sound/tas25xx-dsp.h>
> > +
> > +
> > +static void tas25xx_process_fw_delay(struct tas25xx_cmd *cmd)
> > +{
> > +	mdelay(cpu_to_be16(cmd->hdr.length));
>=20
> is this the length of the header, or the duration of the delay?
>=20
> Someone will get it wrong with this naming...
>=20
I think this is because of the format.
If cmd_type is TAS25XX_CMD_DELAY, then hdr.length is the length of the
delay.
At least I think so, based on
https://lore.kernel.org/lkml/6d6aaed3-dac8-e1ec-436c-9b04273df2b3@ti.com/T/
https://github.com/torvalds/linux/blob/bee0e7762ad2c6025b9f5245c040fcc36ef2=
bde8/sound/soc/codecs/tas2781-fmwlib.c#L769

But I don't see any TAS25XX_CMD_DELAY command in the firmware I'm
using.

> >=20
> > +	prog_num =3D cpu_to_be32(fw_data->hdr->num_programs);
> > +	config_num =3D cpu_to_be32(fw_data->hdr->num_configs);
> > +	dev_info(dev, "Firmware loaded: programs %d, configs %d\n",
> > +		prog_num, config_num);
> > +

For me:
release_firmware(fw) is missing from here

> > +	return fw_data;
> > +
> > +err_prog:
> > +	devm_kfree(dev, fw_data->prog_data);
> > +err_hdr:
> > +	devm_kfree(dev, fw_data->hdr);
> > +err_data:
> > +	devm_kfree(dev, fw_data);
> > +err_fw:
> > +	release_firmware(fw);
> > +
> > +	return NULL;
> > +}
> >=20

Regards,

Gergo

