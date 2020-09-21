Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E744273240
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 20:52:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA5F716CB;
	Mon, 21 Sep 2020 20:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA5F716CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600714349;
	bh=op9b6UK8xtjQlPHY6DKh5HXqi9MAlw1acnoRkyZEhs0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hKofd/D1I1pXXpY4aBU5KA9DJKWgQeTZCVmex0LZIsZsK6scnM5Vcd+LPqob2Lsfx
	 16yuY+aq0Q9Hxne8qYpp/wR94H3ckxyif66lOor6Avt/lqwnGOpD6OUXtUgGtDG7DN
	 Vl7uvIb4upl0QqKd7Ly0U9JbPCsBus9/ZkOOSs8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D25FCF8010A;
	Mon, 21 Sep 2020 20:50:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50975F80162; Mon, 21 Sep 2020 20:50:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08976F8010A
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 20:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08976F8010A
IronPort-SDR: Qt/slR64a8fNraStLNZvmszu/ruqcR27/Zusd6GDPZwri/vSi+ewdocbz8G2KwQss8wouo00EV
 tVDxqaSlsR+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="157830299"
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; d="scan'208";a="157830299"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 11:50:33 -0700
IronPort-SDR: bU7OcabfqAbWDMSGjdP6QBGkB0wXQswLJafi0UBWWsb6jxFC9Ig3dQE2o0WRSxU/15WF+nEnU6
 +EgNHZL7DcRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; d="scan'208";a="290119631"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by fmsmga007.fm.intel.com with ESMTP; 21 Sep 2020 11:50:31 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Sep 2020 19:50:27 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 21 Sep 2020 19:50:27 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v7 06/14] ASoC: Intel: catpt: PCM operations
Thread-Topic: [PATCH v7 06/14] ASoC: Intel: catpt: PCM operations
Thread-Index: AQHWkA4xth1OLigrcEemrO6uguA2k6lzEHEAgABe3lA=
Date: Mon, 21 Sep 2020 18:50:27 +0000
Message-ID: <a0d48879e3844be0a869f9e61e40eae8@intel.com>
References: <20200921115424.4105-1-cezary.rojewski@intel.com>
 <20200921115424.4105-7-cezary.rojewski@intel.com>
 <20200921140820.GV3956970@smile.fi.intel.com>
In-Reply-To: <20200921140820.GV3956970@smile.fi.intel.com>
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
 Krzysztof" <krzysztof.hejmowski@intel.com>, "Papierkowski,
 Piotr \(Habana\)" <ppapierkowski@habana.ai>, "Gopal, 
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

On 2020-09-21 4:08 PM, Andy Shevchenko wrote:
> On Mon, Sep 21, 2020 at 01:54:16PM +0200, Cezary Rojewski wrote:
>> DSP designed for Lynxpoint and Wildcat Point offers no dynamic topology
>> i.e. all pipelines are already defined within firmware and host is
>> relegated to allocing stream for predefined pins. This is represented by
>> 'catpt_topology' member.
>>
...

>> +
>> +static void catpt_arrange_page_table(struct snd_pcm_substream *substrea=
m,
>> +				     struct snd_dma_buffer *pgtbl)
>> +{
>> +	struct snd_pcm_runtime *rtm =3D substream->runtime;
>> +	struct snd_dma_buffer *databuf =3D snd_pcm_get_dma_buf(substream);
>> +	int i, pages;
>> +
>> +	pages =3D snd_sgbuf_aligned_pages(rtm->dma_bytes);
>> +
>> +	for (i =3D 0; i < pages; i++) {
>> +		u32 pfn, offset;
>> +		u32 *page_table;
>> +
>> +		pfn =3D snd_sgbuf_get_addr(databuf, i * PAGE_SIZE) >> PAGE_SHIFT;
>=20
> PFN_DOWN()
>=20
Ack. Updating in both cases where explicit right shift by PAGE_SHIFT is use=
d.

>> +		/* incrementing by 2 on even and 3 on odd */
>> +		offset =3D ((i << 2) + i) >> 1;
>> +		page_table =3D (u32 *)(pgtbl->area + offset);
>> +
>> +		if (i & 1)
>> +			*page_table |=3D (pfn << 4);
>> +		else
>> +			*page_table |=3D pfn;
>> +	}
>> +}
>> +
>> +static u32 catpt_get_channel_map(enum catpt_channel_config config)
>> +{
>> +	switch (config) {
>> +	case CATPT_CHANNEL_CONFIG_MONO:
>> +		return (0xFFFFFFF0 | CATPT_CHANNEL_CENTER);
>> +
>> +	case CATPT_CHANNEL_CONFIG_STEREO:
>> +		return (0xFFFFFF00 | CATPT_CHANNEL_LEFT
>> +				   | (CATPT_CHANNEL_RIGHT << 4));
>> +
>> +	case CATPT_CHANNEL_CONFIG_2_POINT_1:
>> +		return (0xFFFFF000 | CATPT_CHANNEL_LEFT
>> +				   | (CATPT_CHANNEL_RIGHT << 4)
>> +				   | (CATPT_CHANNEL_LFE << 8));
>> +
>> +	case CATPT_CHANNEL_CONFIG_3_POINT_0:
>> +		return (0xFFFFF000 | CATPT_CHANNEL_LEFT
>> +				   | (CATPT_CHANNEL_CENTER << 4)
>> +				   | (CATPT_CHANNEL_RIGHT << 8));
>> +
>> +	case CATPT_CHANNEL_CONFIG_3_POINT_1:
>> +		return (0xFFFF0000 | CATPT_CHANNEL_LEFT
>> +				   | (CATPT_CHANNEL_CENTER << 4)
>> +				   | (CATPT_CHANNEL_RIGHT << 8)
>> +				   | (CATPT_CHANNEL_LFE << 12));
>> +
>> +	case CATPT_CHANNEL_CONFIG_QUATRO:
>> +		return (0xFFFF0000 | CATPT_CHANNEL_LEFT
>> +				   | (CATPT_CHANNEL_RIGHT << 4)
>> +				   | (CATPT_CHANNEL_LEFT_SURROUND << 8)
>> +				   | (CATPT_CHANNEL_RIGHT_SURROUND << 12));
>> +
>> +	case CATPT_CHANNEL_CONFIG_4_POINT_0:
>> +		return (0xFFFF0000 | CATPT_CHANNEL_LEFT
>> +				   | (CATPT_CHANNEL_CENTER << 4)
>> +				   | (CATPT_CHANNEL_RIGHT << 8)
>> +				   | (CATPT_CHANNEL_CENTER_SURROUND << 12));
>> +
>> +	case CATPT_CHANNEL_CONFIG_5_POINT_0:
>> +		return (0xFFF00000 | CATPT_CHANNEL_LEFT
>> +				   | (CATPT_CHANNEL_CENTER << 4)
>> +				   | (CATPT_CHANNEL_RIGHT << 8)
>> +				   | (CATPT_CHANNEL_LEFT_SURROUND << 12)
>> +				   | (CATPT_CHANNEL_RIGHT_SURROUND << 16));
>> +
>> +	case CATPT_CHANNEL_CONFIG_5_POINT_1:
>> +		return (0xFF000000 | CATPT_CHANNEL_CENTER
>> +				   | (CATPT_CHANNEL_LEFT << 4)
>> +				   | (CATPT_CHANNEL_RIGHT << 8)
>> +				   | (CATPT_CHANNEL_LEFT_SURROUND << 12)
>> +				   | (CATPT_CHANNEL_RIGHT_SURROUND << 16)
>> +				   | (CATPT_CHANNEL_LFE << 20));
>> +
>> +	case CATPT_CHANNEL_CONFIG_DUAL_MONO:
>> +		return (0xFFFFFF00 | CATPT_CHANNEL_LEFT
>> +				   | (CATPT_CHANNEL_LEFT << 4));
>> +
>> +	default:
>> +		return 0xFFFFFFFF;
>> +	}
>=20
> GENMASK() for all above?
>=20

Ack. GENMASK + U32_MAX for the 'default' label.

>> +}
>> +
>> +static enum catpt_channel_config catpt_get_channel_config(u32 num_chann=
els)
>> +{
>> +	switch (num_channels) {
>> +	case 6:
>> +		return CATPT_CHANNEL_CONFIG_5_POINT_1;
>> +	case 5:
>> +		return CATPT_CHANNEL_CONFIG_5_POINT_0;
>> +	case 4:
>> +		return CATPT_CHANNEL_CONFIG_QUATRO;
>> +	case 3:
>> +		return CATPT_CHANNEL_CONFIG_2_POINT_1;
>> +	case 1:
>> +		return CATPT_CHANNEL_CONFIG_MONO;
>> +	case 2:
>> +	default:
>> +		return CATPT_CHANNEL_CONFIG_STEREO;
>> +	}
>> +}
>> +
>> +static int catpt_dai_startup(struct snd_pcm_substream *substream,
>> +			     struct snd_soc_dai *dai)
>> +{
>> +	struct catpt_dev *cdev =3D dev_get_drvdata(dai->dev);
>> +	struct catpt_stream_template *template;
>> +	struct catpt_stream_runtime *stream;
>> +	struct resource *res;
>> +	int ret;
>> +
>> +	template =3D catpt_get_stream_template(substream);
>> +
>> +	stream =3D kzalloc(sizeof(*stream), GFP_KERNEL);
>> +	if (!stream)
>> +		return -ENOMEM;
>> +
>> +	ret =3D snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, cdev->dev, PAGE_SIZE,
>> +				  &stream->pgtbl);
>> +	if (ret)
>> +		goto err_pgtbl;
>> +
>> +	res =3D catpt_request_region(&cdev->dram, template->persistent_size);
>> +	if (!res) {
>> +		ret =3D -EBUSY;
>> +		goto err_request;
>> +	}
>> +
>> +	catpt_dsp_update_srampge(cdev, &cdev->dram, cdev->spec->dram_mask);
>> +
>> +	stream->template =3D template;
>> +	stream->persistent =3D res;
>> +	stream->substream =3D substream;
>> +	INIT_LIST_HEAD(&stream->node);
>> +	snd_soc_dai_set_dma_data(dai, substream, stream);
>> +
>> +	spin_lock(&cdev->list_lock);
>> +	list_add_tail(&stream->node, &cdev->stream_list);
>> +	spin_unlock(&cdev->list_lock);
>> +
>> +	return 0;
>> +
>> +err_request:
>> +	snd_dma_free_pages(&stream->pgtbl);
>> +err_pgtbl:
>> +	kfree(stream);
>> +	return ret;
>> +}
>> +
>> +static void catpt_dai_shutdown(struct snd_pcm_substream *substream,
>> +			       struct snd_soc_dai *dai)
>> +{
>> +	struct catpt_dev *cdev =3D dev_get_drvdata(dai->dev);
>> +	struct catpt_stream_runtime *stream;
>> +
>> +	stream =3D snd_soc_dai_get_dma_data(dai, substream);
>> +
>> +	spin_lock(&cdev->list_lock);
>> +	list_del(&stream->node);
>> +	spin_unlock(&cdev->list_lock);
>> +
>> +	release_resource(stream->persistent);
>> +	kfree(stream->persistent);
>> +	catpt_dsp_update_srampge(cdev, &cdev->dram, cdev->spec->dram_mask);
>> +
>> +	snd_dma_free_pages(&stream->pgtbl);
>> +	kfree(stream);
>> +	snd_soc_dai_set_dma_data(dai, substream, NULL);
>> +}
>> +
>> +static int catpt_dai_hw_params(struct snd_pcm_substream *substream,
>> +			       struct snd_pcm_hw_params *params,
>> +			       struct snd_soc_dai *dai)
>> +{
>> +	struct catpt_dev *cdev =3D dev_get_drvdata(dai->dev);
>> +	struct catpt_stream_runtime *stream;
>> +	struct catpt_audio_format afmt;
>> +	struct catpt_ring_info rinfo;
>> +	struct snd_pcm_runtime *rtm =3D substream->runtime;
>> +	struct snd_dma_buffer *dmab;
>> +	int ret;
>> +
>> +	stream =3D snd_soc_dai_get_dma_data(dai, substream);
>> +	if (stream->allocated)
>> +		return 0;
>> +
>> +	memset(&afmt, 0, sizeof(afmt));
>> +	afmt.sample_rate =3D params_rate(params);
>> +	afmt.bit_depth =3D params_physical_width(params);
>> +	afmt.valid_bit_depth =3D params_width(params);
>> +	afmt.num_channels =3D params_channels(params);
>> +	afmt.channel_config =3D catpt_get_channel_config(afmt.num_channels);
>> +	afmt.channel_map =3D catpt_get_channel_map(afmt.channel_config);
>> +	afmt.interleaving =3D CATPT_INTERLEAVING_PER_CHANNEL;
>> +
>> +	dmab =3D snd_pcm_get_dma_buf(substream);
>> +	catpt_arrange_page_table(substream, &stream->pgtbl);
>> +
>> +	memset(&rinfo, 0, sizeof(rinfo));
>> +	rinfo.page_table_addr =3D stream->pgtbl.addr;
>> +	rinfo.num_pages =3D DIV_ROUND_UP(rtm->dma_bytes, PAGE_SIZE);
>> +	rinfo.size =3D rtm->dma_bytes;
>> +	rinfo.offset =3D 0;
>> +	rinfo.ring_first_page_pfn =3D snd_sgbuf_get_addr(dmab, 0) >> PAGE_SHIF=
T;
>> +
>> +	ret =3D catpt_ipc_alloc_stream(cdev, stream->template->path_id,
>> +				     stream->template->type,
>> +				     &afmt, &rinfo,
>> +				     stream->template->num_entries,
>> +				     stream->template->entries,
>> +				     stream->persistent,
>> +				     cdev->scratch,
>> +				     &stream->info);
>> +	if (ret)
>> +		return CATPT_IPC_ERROR(ret);
>> +
>> +	stream->allocated =3D true;
>> +	return 0;
>> +}
>> +
>> +static int catpt_dai_hw_free(struct snd_pcm_substream *substream,
>> +			     struct snd_soc_dai *dai)
>> +{
>> +	struct catpt_dev *cdev =3D dev_get_drvdata(dai->dev);
>> +	struct catpt_stream_runtime *stream;
>> +
>> +	stream =3D snd_soc_dai_get_dma_data(dai, substream);
>> +	if (!stream->allocated)
>> +		return 0;
>> +
>> +	catpt_ipc_reset_stream(cdev, stream->info.stream_hw_id);
>> +	catpt_ipc_free_stream(cdev, stream->info.stream_hw_id);
>> +
>> +	stream->allocated =3D false;
>> +	return 0;
>> +}
>> +
>> +static int catpt_set_dspvol(struct catpt_dev *cdev, u8 stream_id, long =
*ctlvol);
>> +
>> +static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
>> +				     struct catpt_stream_runtime *stream)
>> +{
>> +	struct catpt_dev *cdev =3D dev_get_drvdata(dai->dev);
>> +	struct snd_soc_component *component =3D dai->component;
>> +	struct snd_kcontrol *pos, *kctl =3D NULL;
>> +	const char *name;
>> +	int ret;
>> +	u32 id =3D stream->info.stream_hw_id;
>> +
>> +	/* only selected streams have individual controls */
>> +	switch (id) {
>> +	case CATPT_PIN_ID_OFFLOAD1:
>> +		name =3D "Media0 Playback Volume";
>> +		break;
>> +	case CATPT_PIN_ID_OFFLOAD2:
>> +		name =3D "Media1 Playback Volume";
>> +		break;
>> +	case CATPT_PIN_ID_CAPTURE1:
>> +		name =3D "Mic Capture Volume";
>> +		break;
>> +	case CATPT_PIN_ID_REFERENCE:
>> +		name =3D "Loopback Mute";
>> +		break;
>> +	default:
>> +		return 0;
>> +	};
>> +
>> +	list_for_each_entry(pos, &component->card->snd_card->controls, list) {
>> +		if (pos->private_data =3D=3D component &&
>> +		    !strncmp(name, pos->id.name, sizeof(pos->id.name))) {
>> +			kctl =3D pos;
>> +			break;
>> +		}
>> +	}
>> +	if (!kctl)
>> +		return -ENOENT;
>> +
>> +	if (stream->template->type !=3D CATPT_STRM_TYPE_LOOPBACK)
>> +		return catpt_set_dspvol(cdev, id, (long *)kctl->private_value);
>> +	ret =3D catpt_ipc_mute_loopback(cdev, id, *(bool *)kctl->private_value=
);
>> +	if (ret)
>> +		return CATPT_IPC_ERROR(ret);
>> +	return 0;
>> +}
>> +
>> +static int catpt_dai_prepare(struct snd_pcm_substream *substream,
>> +			     struct snd_soc_dai *dai)
>> +{
>> +	struct catpt_dev *cdev =3D dev_get_drvdata(dai->dev);
>> +	struct catpt_stream_runtime *stream;
>> +	int ret;
>> +
>> +	stream =3D snd_soc_dai_get_dma_data(dai, substream);
>> +	if (stream->prepared)
>> +		return 0;
>> +
>> +	ret =3D catpt_ipc_reset_stream(cdev, stream->info.stream_hw_id);
>> +	if (ret)
>> +		return CATPT_IPC_ERROR(ret);
>> +
>> +	ret =3D catpt_ipc_pause_stream(cdev, stream->info.stream_hw_id);
>> +	if (ret)
>> +		return CATPT_IPC_ERROR(ret);
>> +
>> +	ret =3D catpt_dsp_update_lpclock(cdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D catpt_dai_apply_usettings(dai, stream);
>> +	if (ret)
>> +		return ret;
>> +
>> +	stream->prepared =3D true;
>> +	return 0;
>> +}
>> +
>> +static int catpt_dai_trigger(struct snd_pcm_substream *substream, int c=
md,
>> +			     struct snd_soc_dai *dai)
>> +{
>> +	struct catpt_dev *cdev =3D dev_get_drvdata(dai->dev);
>> +	struct catpt_stream_runtime *stream;
>> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
>> +	snd_pcm_uframes_t pos;
>> +	int ret;
>> +
>> +	stream =3D snd_soc_dai_get_dma_data(dai, substream);
>> +
>> +	switch (cmd) {
>> +	case SNDRV_PCM_TRIGGER_START:
>> +		/* only offload is set_write_pos driven */
>> +		if (stream->template->type !=3D CATPT_STRM_TYPE_RENDER)
>> +			goto resume_stream;
>> +
>> +		pos =3D frames_to_bytes(runtime, runtime->start_threshold);
>> +		/*
>> +		 * Dsp operates on buffer halves, thus max 2x set_write_pos
>> +		 * (entire buffer filled) prior to stream start.
>> +		 */
>> +		ret =3D catpt_ipc_set_write_pos(cdev, stream->info.stream_hw_id,
>> +					      pos, false, false);
>> +		if (ret)
>> +			return CATPT_IPC_ERROR(ret);
>> +		fallthrough;
>> +	case SNDRV_PCM_TRIGGER_RESUME:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +	resume_stream:
>> +		ret =3D catpt_ipc_resume_stream(cdev, stream->info.stream_hw_id);
>> +		if (ret)
>> +			return CATPT_IPC_ERROR(ret);
>> +		break;
>> +
>> +	case SNDRV_PCM_TRIGGER_STOP:
>> +		stream->prepared =3D false;
>> +		catpt_dsp_update_lpclock(cdev);
>> +		fallthrough;
>> +	case SNDRV_PCM_TRIGGER_SUSPEND:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> +		ret =3D catpt_ipc_pause_stream(cdev, stream->info.stream_hw_id);
>> +		if (ret)
>> +			return CATPT_IPC_ERROR(ret);
>> +		break;
>> +
>> +	default:
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +void catpt_stream_update_position(struct catpt_dev *cdev,
>> +				  struct catpt_stream_runtime *stream,
>> +				  struct catpt_notify_position *pos)
>> +{
>> +	struct snd_pcm_substream *substream =3D stream->substream;
>> +	struct snd_pcm_runtime *r =3D substream->runtime;
>> +	snd_pcm_uframes_t dsppos, newpos;
>> +	int ret;
>> +
>> +	dsppos =3D bytes_to_frames(r, pos->stream_position);
>> +
>> +	/* only offload is set_write_pos driven */
>> +	if (stream->template->type !=3D CATPT_STRM_TYPE_RENDER)
>> +		goto exit;
>> +
>> +	if (dsppos >=3D r->buffer_size / 2)
>> +		newpos =3D r->buffer_size / 2;
>> +	else
>> +		newpos =3D 0;
>> +	/*
>> +	 * Dsp operates on buffer halves, thus on every notify position
>> +	 * (buffer half consumed) update wp to allow stream progression.
>> +	 */
>> +	ret =3D catpt_ipc_set_write_pos(cdev, stream->info.stream_hw_id,
>> +				      frames_to_bytes(r, newpos),
>> +				      false, false);
>> +	if (ret) {
>> +		dev_err(cdev->dev, "update position for stream %d failed: %d\n",
>> +			stream->info.stream_hw_id, ret);
>> +		return;
>> +	}
>> +exit:
>> +	snd_pcm_period_elapsed(substream);
>> +}
>> +
>> +#define CATPT_BUFFER_MAX_SIZE	76800 /* 200ms native format */
>=20
> I don't understand 'native format'. Please, give clearer comment, like
>=20
> /* 200ms for 8 8-bit channels at 48kHz (native format) */
>=20

Sure, will expand the description. Just so you know, it's 2/24(32)/48kHz
for LPT/WPT solution.

>> +#define CATPT_PCM_PERIODS_MAX	4
>> +#define CATPT_PCM_PERIODS_MIN	2
>> +

...

>=20
>> +#define DSP_VOLUME_MAX	0x7FFFFFFF /* 0db */
>=20
> S32_MAX ?
>=20
Ack.

>> +static const u32 volume_map[] =3D {
>> +	DSP_VOLUME_MAX >> 30,
>> +	DSP_VOLUME_MAX >> 29,
>> +	DSP_VOLUME_MAX >> 28,
>> +	DSP_VOLUME_MAX >> 27,
>> +	DSP_VOLUME_MAX >> 26,
>> +	DSP_VOLUME_MAX >> 25,
>> +	DSP_VOLUME_MAX >> 24,
>> +	DSP_VOLUME_MAX >> 23,
>> +	DSP_VOLUME_MAX >> 22,
>> +	DSP_VOLUME_MAX >> 21,
>> +	DSP_VOLUME_MAX >> 20,
>> +	DSP_VOLUME_MAX >> 19,
>> +	DSP_VOLUME_MAX >> 18,
>> +	DSP_VOLUME_MAX >> 17,
>> +	DSP_VOLUME_MAX >> 16,
>> +	DSP_VOLUME_MAX >> 15,
>> +	DSP_VOLUME_MAX >> 14,
>> +	DSP_VOLUME_MAX >> 13,
>> +	DSP_VOLUME_MAX >> 12,
>> +	DSP_VOLUME_MAX >> 11,
>> +	DSP_VOLUME_MAX >> 10,
>> +	DSP_VOLUME_MAX >> 9,
>> +	DSP_VOLUME_MAX >> 8,
>> +	DSP_VOLUME_MAX >> 7,
>> +	DSP_VOLUME_MAX >> 6,
>> +	DSP_VOLUME_MAX >> 5,
>> +	DSP_VOLUME_MAX >> 4,
>> +	DSP_VOLUME_MAX >> 3,
>> +	DSP_VOLUME_MAX >> 2,
>> +	DSP_VOLUME_MAX >> 1,
>> +	DSP_VOLUME_MAX >> 0,
>> +};
>=20
> Why do you have table? Does it have any gaps? Why can't be formula used?
>=20

No gaps, just a lookup table. As catpt aims to keep 100% backward
compatibility with what sound/soc/intel/haswell solution exposes, it is
also useful for filling kcontrol info: catpt_volume_info() function.

>> +static u32 ctlvol_to_dspvol(u32 value)
>> +{
>> +	if (value >=3D ARRAY_SIZE(volume_map))
>> +		value =3D 0;
>> +	return volume_map[value];
>> +}
>> +
>> +static u32 dspvol_to_ctlvol(u32 volume)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(volume_map); i++)
>> +		if (volume_map[i] >=3D volume)
>> +			return i;
>=20
>> +	return i - 1;
>=20
> It seems okay in this case, but in general the code looks dangerous (for
> example, if ARRAY_SIZE is 0).
>=20

Agreed, although volume_map will never change so I've decided to drop
additional safety.

...

>> +}
>> +
>> +static int catpt_set_dspvol(struct catpt_dev *cdev, u8 stream_id, long =
*ctlvol)
>> +{
>> +	bool all_equal =3D true;
>> +	u32 dspvol;
>> +	int ret, i;
>=20
>> +	for (i =3D 1; all_equal && i < CATPT_CHANNELS_MAX; i++)
>> +		all_equal =3D (ctlvol[i] =3D=3D ctlvol[0]);
>=20
> 	for (i =3D 1; i < CATPT_CHANNELS_MAX; i++)
> 		if (ctlvol[i] !=3D ctlvol[0])
> 			break;
>=20
>> +	if (all_equal) {
>=20
> if (i =3D=3D _MAX)
>=20
> and one variable less.
>=20
Keen eye, thanks for this tip! Ack.


...

>> +		dspvol =3D ctlvol_to_dspvol(ctlvol[0]);
>> +
>> +		ret =3D catpt_ipc_set_volume(cdev, stream_id,
>> +					   CATPT_ALL_CHANNELS_MASK, dspvol,
>> +					   0, CATPT_AUDIO_CURVE_NONE);
>> +	} else {
>> +		for (i =3D 0; i < CATPT_CHANNELS_MAX; i++) {
>> +			dspvol =3D ctlvol_to_dspvol(ctlvol[i]);
>> +
>> +			ret =3D catpt_ipc_set_volume(cdev, stream_id,
>> +						   i, dspvol,
>> +						   0, CATPT_AUDIO_CURVE_NONE);
>=20
>> +			if (ret)
>> +				goto exit;
>=20
> Don't see necessity of this in this patch...
>=20
>> +		}
>> +	}
>=20
>> +exit:
>=20
> ...neither this.
>=20

Believe simple 'break' suffices. 'exit' label becomes redundant too.

Thanks,
Czarek

